class CreateMetricPresentations < ActiveRecord::Migration[7.2]
  def change
    create_table :metric_presentations do |t|
      t.string :metric_name
      t.string :chart_type
      t.text :lambda
      t.string :color_palette
      t.string :title

      t.timestamps
    end
    add_index :metric_presentations, :metric_name, unique: true
  end
end
