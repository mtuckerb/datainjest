  module ChartGenerators
    class ChartGenerator
      def initialize(metric, presentation)
        @metric = metric
        @presentation = presentation
      end

      def generate
        # puts "📈 Generating chart for #{@metric[:name]}"
        # puts "Chart type: #{@presentation.chart_type}"
        # puts "Metric data: #{@metric[:data].inspect}"
        # puts "Presentation lambda: #{@presentation.lambda.inspect}"

        chart = Vega.lite
          .data(@metric[:data])
          .width(800)
          .height(400)
          .title(@presentation.title)

        chart = setup_chart_type(chart)
        # puts "Chart after setup: #{chart.inspect}"
        
        chart = add_special_features(chart)
        chart = add_color_encoding(chart)
        add_background_highlight(chart)
      end

      private

      def setup_chart_type(chart)
        case @presentation.chart_type
        when 'gauge', 'arc'
          setup_gauge_chart(chart)
        when 'stacked_line'
          setup_stacked_line_chart(chart)
        else
          setup_default_chart(chart)
        end
      end

      def setup_gauge_chart(chart)
        current_value = @metric[:data].first[:value].to_f
        target_value = 145  # Fixed target value
        min_value = @presentation.chart_min || 0
        max_value = @presentation.chart_max || [@metric[:data].map { |d| d[:value].to_f }.max, target_value].max * 1.2
      
      
        # Calculate angles in radians
        start_angle = -Math::PI / 2  # -90 degrees
        end_angle = Math::PI / 2     # 90 degrees
        current_angle = start_angle + ((current_value - min_value) / (max_value - min_value)) * Math::PI
        target_angle = start_angle + ((target_value - min_value) / (max_value - min_value)) * Math::PI
      
        # Evaluate lambda to determine target range
        lambda_function = eval(@presentation.lambda)
        in_target_range = lambda_function.call(current_value)
      
        # Determine colors based on the color palette
        color_palette = JSON.parse(@presentation.color_palette)
        below_target_color = color_palette.first
        above_target_color = color_palette.last
      
        chart
          .layer([
            # Background arc
            {
              mark: { 
                type: :arc, 
                innerRadius: 120, 
                outerRadius: 160, 
                startAngle: start_angle, 
                endAngle: end_angle,
                stroke: '#ccc', 
                strokeWidth: 2 
              },
              encoding: {
                color: { value: '#eee' }
              }
            },
            # Arc up to target
            {
              mark: { 
                type: :arc, 
                innerRadius: 120, 
                outerRadius: 160,
                startAngle: start_angle,
                endAngle: { expr: "min(#{target_angle}, #{current_angle})" }
              },
              encoding: {
                color: { value: below_target_color }
              }
            },
            # Arc over target
            {
              mark: { 
                type: :arc, 
                innerRadius: 120, 
                outerRadius: 160,
                startAngle: { expr: "#{target_angle}" },
                endAngle: { expr: "max(#{target_angle}, #{current_angle})" }
              },
              encoding: {
                color: { value: above_target_color }
              }
            },
            # Current value text
            {
              mark: { type: :text, align: :center, baseline: :middle, fontSize: 24 },
              encoding: {
                text: { value: current_value.round(1).to_s },
                x: { value: 400 },
                y: { value: 200 }
              }
            },
            # Metric name text
            {
              mark: { type: :text, align: :center, baseline: :middle, fontSize: 18 },
              encoding: {
                text: { value: @metric[:name].titleize },
                x: { value: 400 },
                y: { value: 250 }
              }
            },
            # Min value label
            {
              mark: { type: :text, align: :right, baseline: :middle, fontSize: 14 },
              encoding: {
                text: { value: min_value.round(1).to_s },
                x: { value: 240 },  # Adjusted for arc start
                y: { value: 200 }
              }
            },
            # Max value label
            {
              mark: { type: :text, align: :left, baseline: :middle, fontSize: 14 },
              encoding: {
                text: { value: max_value.round(1).to_s },
                x: { value: 560 },  # Adjusted for arc end
                y: { value: 200 }
              }
            }
          ])
          .width(800)
          .height(400)
          .config(view: { stroke: nil })
      end
      
      def setup_stacked_line_chart(chart)
        chart
          .mark(:line)
          .encoding(
            x: { field: :date, type: :temporal, title: 'Date' },
            y: { field: :value, type: :quantitative, title: @presentation.title },
            color: { field: :type, type: :nominal },
            strokeDash: { 
              field: :type, 
              type: :nominal,
              scale: {
                domain: ['avg', 'min', 'max', 'qty'],
                range: ['5,5', 'solid', 'solid', 'solid']
              }
            }
          )
          .transform([
            {
              fold: ['avg', 'min', 'max', 'qty'],
              as: ['type', 'value']
            }
          ])
          .config(
            line: { strokeWidth: 2 },
            point: { size: 30 }
          )
      end
      
      def setup_default_chart(chart)
        chart
          .mark(@presentation.chart_type.to_sym)
          .encoding(
            x: { field: :date, type: :temporal, title: 'Date' },
            y: y_encoding
          )
      end

      def y_encoding
        case @metric[:name]
        when 'blood_pressure'
          { field: ['systolic', 'diastolic'], type: :quantitative, title: 'Blood Pressure' }
        else
          { field: :value, type: :quantitative, title: @presentation.title }
        end
      end

      def add_weight_features(chart)
        target_weight = 145 # This should ideally come from a configuration
        case @presentation.chart_type
        when 'arc'
          add_arc_weight_features(chart, target_weight)
        when 'gauge'
          # The gauge chart is already set up in setup_gauge_chart, so we don't need to do anything here
          chart
        else
          add_line_weight_features(chart, target_weight)
        end
      end
  
      def add_line_features(chart)
        return chart unless @presentation.lambda.present?
      
        begin
          lambda_function = eval(@presentation.lambda)
          current_value = @metric[:data].first[:value]
          target_value = lambda_function.call(current_value)
      
      
          chart.layer([
            chart,
            Vega.lite
              .mark(:rule)
              .encoding(
                y: { value: target_value },
                color: { value: 'red' },
                size: { value: 2 }
              )
          ])
        rescue StandardError => e
          puts "Error in add_line_features for #{@metric[:name]}: #{e.message}"
          chart  # Return the original chart if there's an error
        end
      end

      def add_line_weight_features(chart, target_weight)
        # Add a horizontal line for the target weight
        chart.layer([
          chart,
          Vega.lite
            .mark(:rule)
            .encoding(
              y: { value: target_weight },
              color: { value: 'red' },
              size: { value: 2 }
            )
        ])
      end

      def add_color_encoding(chart)
        return chart if @presentation.chart_type == 'gauge'
        return chart unless @presentation.lambda.present?
      
        begin
          color_palette = JSON.parse(@presentation.color_palette)
          color_palette = ['#ff0000', '#00ff00'] if color_palette.size < 2
      
          if @presentation.chart_type == 'stacked_line'
            chart.encoding(
              color: {
                field: :type,
                type: :nominal,
                scale: { range: color_palette }
              }
            )
          else
            lambda_function = eval(@presentation.lambda)
            chart.encoding(color: {
              field: :value,
              type: :quantitative,
              scale: { domain: [0, 1], range: color_palette },
              condition: { 
                test: lambda_function.call('datum.value.toString()').to_s,
                value: color_palette.last 
              },
              value: color_palette.first
            })
          end
        rescue StandardError => e
          puts "Error in add_color_encoding for #{@metric[:name]}: #{e.message}"
          chart  # Return the original chart if there's an error
        end
      end 

      def add_background_highlight(chart)
        return chart if @presentation.chart_type == 'gauge' || @presentation.chart_type == 'stacked_line'
        return chart unless @presentation.lambda.present?
      
        lambda_function = eval(@presentation.lambda)
        
        chart.layer([
          Vega.lite
            .mark(:rect)
            .encoding(
              x: { field: :date, type: :temporal },
              x2: { field: :date, type: :temporal },
              y: { field: :value, type: :quantitative },
              y2: { value: 0 },
              color: {
                condition: {
                  test: "!#{lambda_function.call('datum.value')}",
                  value: '#FEE0D2'  # Light red color
                },
                value: 'transparent'
              }
            ),
          chart
        ])
      end

      def add_special_features(chart)
        case @presentation.chart_type
        when 'gauge'
          # Gauge charts are already set up in setup_gauge_chart, so we don't need to do anything here
          chart
        when 'stacked_line'
          # Stacked line charts are already set up in setup_stacked_line_chart, so we don't need to do anything here
          chart
        when 'line', 'bar', 'area', 'point'
          add_line_features(chart)
        else
          chart
        end
      end
    
  
    end
end