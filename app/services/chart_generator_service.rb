require 'base64'

class ChartGeneratorService
  def initialize(metrics)
    @metrics = metrics
  end

  def generate_charts
    @metrics.map do |metric|
      generate_chart(metric)
    end.compact
  end

  private

  def generate_chart(metric)
    return nil unless metric[:data].present?

    data = prepare_data(metric)
    
    {
      type: chart_type(metric),
      data: data,
      options: {
        responsive: true,
        plugins: {
          title: {
            display: true,
            text: metric[:name].titleize
          }
        }
      }
    }
  end

  def prepare_data(metric)
    labels = metric[:data].map { |m| m[:date] }
    datasets = [{
      label: metric[:name].titleize,
      data: metric[:data].map { |m| m[:qty] }
    }]

    { labels: labels, datasets: datasets }
  end

  def chart_type(metric)
    case metric[:name]
    when 'blood_pressure'
      'line'
    when 'weight_body_mass'
      'line'
    else
      'bar'
    end
  end
end