class CreateEScooters < ActiveRecord::Migration[8.0]
  def change
    create_table :e_scooters do |t|
      t.references :e_transportation, foreign_key: true, null: false
      t.string :type, null: false
      t.string :sensor_type, null: false
      t.boolean :lost_sensor, default: false

      t.timestamps
    end
  end
end
