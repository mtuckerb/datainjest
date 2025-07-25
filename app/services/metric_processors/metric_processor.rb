module MetricProcessors

  class MetricProcessor
    def self.for(metric_name)
      case metric_name
      when "blood_pressure"
        BloodPressureProcessor.new
      when "heart_rate"
        HeartRateProcessor.new
      when "step_count"
        StepCountProcessor.new
      when "weight_body_mass"
        WeightProcessor.new
      when "basal_energy_burned"
        AccumulatingMetricProcessor.new
      else
        DefaultMetricProcessor.new
      end
    end

    def format_summary(summary)
      summary.to_s
    end
  end 
end