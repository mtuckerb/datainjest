module MetricProcessors
  class HeartRateProcessor
    def process(data)
      data.map do |m|
        {
          date: m['date'],
          avg: m['Avg'].to_f,
          min: m['Min'].to_f,
          max: m['Max'].to_f,
        }
      end
    end

    def summarize(data)
      {
        average: (data.sum { |m| m['Avg'].to_f } / data.size).round(2),
        min: data.min_by { |m| m['Min'].to_f }['Min'].to_f.round(2),
        max: data.max_by { |m| m['Max'].to_f }['Max'].to_f.round(2)
      }
    end

    def format_summary(name, summary)
      [
        "#{name}_average: #{summary[:average]}",
        "#{name}_min: #{summary[:min]}",
        "#{name}_max: #{summary[:max]}"
      ]
    end
  end
end
