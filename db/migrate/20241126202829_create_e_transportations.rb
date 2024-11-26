class CreateETransportations < ActiveRecord::Migration[8.0]
  def change
    create_table :e_transportations do |t|
      t.string :type, null: false
      t.string :sensor_type, null: false
      t.integer :owner_id, null: false
      t.boolean :in_zone, default: false


      t.timestamps
    end

    add_index :e_transportations, :owner_id
    add_index :e_transportations, :type
  end
end
