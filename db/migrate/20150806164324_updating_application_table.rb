class UpdatingApplicationTable < ActiveRecord::Migration
  def change
    add_column :applications, :description, :text
    add_column :applications, :playing_at,  :string
    add_column :applications, :looking_for, :text
    add_column :applications, :level, :string
    add_column :applications, :best_result, :text
    add_column :applications, :age, :integer
    add_column :applications, :location, :string
  end
end
