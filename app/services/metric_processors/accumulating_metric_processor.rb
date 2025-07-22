module MetricProcessors

  class AccumulatingMetricProcessor
    def process(data)
      data.inject({date: Date.new, value: 0}) do |memo, metric| 
        qty = memo[:value] + metric['qty'].to_f
        { date: metric['date'], value: qty.to_f } 
      end
    end

    def summarize(data)
      {
        total: data.sum { |m| m['qty'].to_f }&.round(2),
        value: data.last[:value]&.round(2),
      }
    end

    def format_summary(name, summary)
      [
        "#{name}_total: #{summary[:total]}"
      ]
    end
  end
end