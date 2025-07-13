module MetricProcessors
  class WeightProcessor < DefaultMetricProcessor
    def process(data)
      puts "🏋️ Processing weight data: #{data.inspect}"
      processed_data = data.map do |m|
        {
          date: m['date'],
          value: m['qty'].to_f.round(2)
        }
      end
      puts "Processed weight data: #{processed_data.inspect}"
      processed_data
    end

    def summarize(data)
      daily_average = data.sum { |m| m['qty'].to_f } / data.size
      {
        average: daily_average.round(2),
        latest: data.last['qty'].to_f.round(2)
      }
    end

    def format_summary(name, summary)
      [
        "#{name}_average: #{summary[:average]}",
        "#{name}_latest: #{summary[:latest]}"
      ]
    end
  end

end