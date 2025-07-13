module MetricProcessors
  class StepCountProcessor < DefaultMetricProcessor
    def format_summary(name, summary)
      [
        "#{name}_total: #{summary[:total]}",
        "#{name}_average: #{summary[:average]}"
      ]
    end
  end
end