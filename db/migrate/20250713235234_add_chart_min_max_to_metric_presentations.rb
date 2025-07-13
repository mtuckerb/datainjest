class AddChartMinMaxToMetricPresentations < ActiveRecord::Migration[7.2]
  def change
    add_column :metric_presentations, :chart_min, :float
    add_column :metric_presentations, :chart_max, :float
  end
end
