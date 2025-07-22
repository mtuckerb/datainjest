module MetricProcessors
  class BloodPressureProcessor
    def process(data)
      data.map do |m|
        {
          'date' => m['date'],
          'systolic' => m['systolic'].to_f,
          'diastolic' => m['diastolic'].to_f
        }
      end
    end

    def summarize(data)
      latest = data.max_by { |m| m['date'] }
      {
        latest: { systolic: latest['systolic'].to_f, diastolic: latest['diastolic'].to_f },
        average: {
          systolic: (data.sum { |m| m['systolic'].to_f } / data.size).round(2),
          diastolic: (data.sum { |m| m['diastolic'].to_f } / data.size).round(2)
        }
      }
    end

    def format_summary(name, summary)
      [
        "#{name}_latest_systolic: #{summary[:latest][:systolic]}",
        "#{name}_latest_diastolic: #{summary[:latest][:diastolic]}",
        "#{name}_average_systolic: #{summary[:average][:systolic]}",
        "#{name}_average_diastolic: #{summary[:average][:diastolic]}"
      ]
    end
  end
end