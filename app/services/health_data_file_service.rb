require 'vega'
require_relative 'metric_processors/metric_processor'
require_relative 'metric_processors/default_metric_processor'
require_relative 'metric_processors/blood_pressure_processor'
require_relative 'metric_processors/heart_rate_processor'
require_relative 'metric_processors/step_count_processor'
require_relative 'metric_processors/weight_processor'
require_relative 'chart_generators/chart_generator'

class HealthDataFileService
  def initialize(date)
    @date = date
    @date_directory = date&.strftime("%Y/%m/%d")
    @fullpath = "/data/vimwiki/knowledgebase/#{@date_directory}"
    @metrics = process_metrics(fetch_metrics)
  end

  def create_files
    FileUtils.mkdir_p("#{@fullpath}/Attachments/health_data")
    create_charts
    create_markdown_file
  end

  private

  def fetch_metrics
    HealthMetric.where(date: @date.beginning_of_day..@date.end_of_day)
      .group_by(&:name)
      .map do |name, records|
        {
          name: name,
          data: records.map { |r| r.data.merge('date' => r.date.to_s) }
        }
      end
  rescue StandardError => e
    Rails.logger.error "Error fetching metrics: #{e.message}"
    []
  end

  def process_metrics(raw_metrics)
    raw_metrics.map do |metric|
      processor = MetricProcessors::MetricProcessor.for(metric[:name])
      processed_data = processor.process(metric[:data])
      
      if metric[:name] == 'blood_pressure'
        {
          name: metric[:name],
          data: processed_data.map { |d| d.merge('date' => d['date'].to_s) },
          summary: processor.summarize(metric[:data])
        }
      else
        {
          name: metric[:name],
          data: processed_data,
          summary: processor.summarize(metric[:data])
        }
      end
    end
  end 

  def create_charts
    @chart_paths = @metrics.map do |metric|
      presentation = MetricPresentation.find_or_create_default(metric[:name])
      next unless presentation.active
      
      chart = ChartGenerators::ChartGenerator.new(metric, presentation).generate
      puts "📈 Generated chart for #{metric[:name]}: "
      
      chart_path = "#{@date&.strftime("%Y-%m-%d")}_#{metric[:name].downcase.gsub(' ', '_')}.svg"
      File.binwrite("#{@fullpath}/Attachments/health_data/#{chart_path}", chart.to_svg)
      chart_path
    end.compact
  end

  def create_markdown_file
    filepath = @date&.strftime("#{@fullpath}/health_data.md")
    file_content = <<~CONTENT
      ---
      #{summary}
      ---
      #{@chart_paths.map { |path| "![[#{path}|500]]" }.join(" ")}
    CONTENT

    File.write(filepath, file_content)
  end

  def summary
    summary_lines = @metrics.flat_map do |metric|
      processor = MetricProcessors::MetricProcessor.for(metric[:name])
      processor.format_summary(metric[:name], metric[:summary])
    end
    summary_lines.push("created: #{@date.strftime("%Y-%m-%d")}")
    summary_lines.push("css_classes: 'wide-page, image-gallery'")
    summary_lines.join("\n")
  end

  def self.rebuild_today_visualizations
    date = Date.today
    service = new(date)
    service.create_files
    puts "Visualizations for #{date} have been rebuilt."
  end

  def self.rebuild_visualizations(date = Date.today)
    service = new(date)
    service.create_files
    puts "Visualizations for #{date} have been rebuilt."
  end
end
