class CreateHealthDataTables < ActiveRecord::Migration[7.0]
  def change
    create_table :health_metrics do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.text :data, null: false
      t.timestamps
    end

    add_index :health_metrics, [:name, :date]
  end
end