class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :sport
      t.integer :rank

      t.timestamps
    end
  end
end
