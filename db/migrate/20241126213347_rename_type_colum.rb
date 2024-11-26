class RenameTypeColum < ActiveRecord::Migration[8.0]
  def change
    rename_column :e_transportations, :type, :transportation_type
  end
end
