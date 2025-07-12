require 'vega'

class HealthDataFileService
  def initialize(date)
    @date = date
    @date_directory = date&.strftime("%Y/%m/%d")
    @fullpath = "/data/vimwiki/knowledgebase/#{@date_directory}"
    @metrics = fetch_metrics || []
  end

  def summary 
    return [] if @metrics.nil? || @metrics.empty?

    @summary = @metrics.map { |metric| "#{metric[:name]}: #{total(metric)}" }
    date = @date || Date.today  # Use @date if available, otherwise use today's date
    @summary.push("created: #{date.strftime("%Y-%m-%d")}")
    @summary
  end

  def create_files
    FileUtils.mkdir_p(@fullpath)
    create_charts
    create_markdown_file
  end

  private

  def create_charts
    @chart_paths = []
    charts.each do |name, chart|
      chart_path = "#{@date&.strftime("%Y-%m-%d")}_#{name.downcase.gsub(' ', '_')}.svg"
      @chart_paths.push(chart_path)
      File.binwrite("#{@fullpath}/Attachments/#{chart_path}", chart.to_svg)
    end
  end

  def create_markdown_file
    filepath = @date&.strftime("#{@fullpath}/health_data.md")
    file_content = <<~CONTENT
      ---
      #{summary.join("\n")}
      ---
      #{@chart_paths.map { |path| "![[#{path}|500]]" }.join(" ")}
    CONTENT
    File.write(filepath, file_content)
  end

  def charts
    @metrics.map do |metric|
      presentation = MetricPresentation.find_by(metric_name: metric[:name])
      data = prepare_data(metric, presentation)
      
      chart = Vega.lite
        .data(data)
        .mark(presentation&.chart_type || :line)
        .encoding(
          x: { field: :date, type: :temporal, title: 'Date' },
          y: y_encoding(metric, presentation),
          color: color_encoding(presentation, metric)
        )
        .width(800)
        .height(400)
        .title(presentation&.title || metric[:name])
  
      chart = add_special_features(chart, metric, presentation)
  
      [metric[:name], chart]
    end
  end
  
  def prepare_data(metric, presentation)
    case metric[:name]
    when 'blood_pressure'
      metric[:data].map { |m| { date: m['date'], systolic: m['systolic'].to_f, diastolic: m['diastolic'].to_f } }
    else
      metric[:data].map { |m| { date: m['date'], value: m['value'].to_f } }
    end
  end
  
  def y_encoding(metric, presentation)
    case metric[:name]
    when 'blood_pressure'
      { field: ['systolic', 'diastolic'], type: :quantitative, title: 'Blood Pressure' }
    else
      { field: :value, type: :quantitative, title: metric[:name] }
    end
  end
  
  def add_special_features(chart, metric, presentation)
    case metric[:name]
    when 'weight_body_mass'
      chart.layer([
        { mark: :rule, encoding: { y: { datum: 145 } } }
      ])
    else
      chart
    end
  end

  def color_encoding(presentation, metric)
    return {} unless presentation&.lambda.present?

    {
      field: :value,
      type: :quantitative,
      scale: {
        domain: [0, 1],
        range: presentation.color_palette || ['#ff0000', '#00ff00']
      },
      condition: {
        test: "datum.value >= #{presentation.target_range_check('datum.value')}",
        value: '#00ff00'
      },
      value: '#ff0000'
    }
  end
  
  def sum(metric)
    metric[:data].sum { |m| m['value'] || 0 }
  end

  def average(metric)
    return 0 if metric[:data].empty?
    sum(metric) / metric[:data].size
  end

  def map_metrics(metric)
    metric[:data]
  end
  def blood_pressure_data(metric) 
    map_metrics(metric)
    .sort_by { |m| m['date'] }
    .map { |m| "#{m['systolic']}/#m['diastolic']}"}
  
  end  

  def total(metric) 
    return unless metric.dig(:name)
    case metric.dig(:name)
    when "apple_stand_hour"
      sum(metric)
    when "apple_exercise_time"
      sum(metric)
    when "flights_climbed"
      sum(metric)
    when "vo2_max"
      average(metric)
    when "stair_speed_down"
      average(metric)
    when  "headphone_audio_exposure"
      average(metric)
    when "stair_speed_up"
      average(metric)
    when "heart_rate_variability"
      average(metric)
    when "apple_stand_time"
      sum(metric)
    when "walking_step_length"
      average(metric)
    when "walking_double_support_percentage"
      average(metric)
    when "blood_oxygen_saturation"
      average(metric)
    when "environmental_audio_exposure"
      average(metric)
    when "walking_speed"
      average(metric)
    when "walking_running_distance"
      sum(metric)
    when "time_in_daylight"
      sum(metric)
    when "step_count"
      sum(metric)
    when "resting_heart_rate"
      average(metric)
    when "walking_heart_rate_average"
      average(metric)
    when "active_energy"
      sum(metric)
    when "basal_energy_burned"
      sum(metric)
    when "physical_effort"
      sum(metric)
    when "weight_body_mass"
      average(metric).round(2)      
    when "blood_pressure"
      blood_pressure_data(metric)
    end
  end

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

  def self.rebuild_today_visualizations
    date = Date.today
    service = new(date)
    service.create_files
    puts "Visualizations for #{date} have been rebuilt."
  end

  def self.rebuild_visualizations(date = Date.today)
    service = new(date)
    service.create_files
    service.update_health_data_file
    puts "Visualizations and health_data file for #{date} have been rebuilt."
  end

  def update_health_data_file
    filepath = @date.strftime("/data/vimwiki/knowledgebase/%Y/%m/%d/health_data.md")
    
    file_content = <<~CONTENT
      ---
      #{summary.join("\n")}
      ---
      #{@chart_paths.map { |path| "![[#{path}|500]]" }.join(" ")}
    CONTENT

    FileUtils.mkdir_p(File.dirname(filepath))
    File.write(filepath, file_content)
    puts "Updated health_data file at #{filepath}"
  end
end