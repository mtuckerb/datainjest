
module MetricProcessors

  class DefaultMetricProcessor
    def process(data)
      data.map { |m| { date: m['date'], value: m['qty'].to_f } }
    end

    def summarize(data)
      {
        total: data.sum { |m| m['qty'].to_f }.round(2),
        average: (data.sum { |m| m['qty'].to_f } / data.size).round(2),
        min: data.min_by { |m| m['qty'].to_f }['qty'].to_f.round(2),
        max: data.max_by { |m| m['qty'].to_f }['qty'].to_f.round(2)
      }
    end

    def format_summary(name, summary)
      [
        "#{name}_total: #{summary[:total]}",
        "#{name}_average: #{summary[:average]}",
        "#{name}_min: #{summary[:min]}",
        "#{name}_max: #{summary[:max]}"
      ]
    end
  end
end