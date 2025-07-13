module MetricProcessors

  class MetricProcessor
    def self.for(metric_name)
      puts "🏭 Selecting processor for: #{metric_name}"
      case metric_name
      when "blood_pressure"
        BloodPressureProcessor.new
      when "heart_rate"
        HeartRateProcessor.new
      when "step_count"
        StepCountProcessor.new
      when "weight_body_mass"
        WeightProcessor.new
      else
        DefaultMetricProcessor.new
      end
    end

    def format_summary(summary)
      summary.to_s
    end
  end 
end