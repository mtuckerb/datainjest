class CreateHealthData < ActiveRecord::Migration[7.2]
  def change
    create_table :health_data do |t|
      t.timestamps
    end
  end
end
