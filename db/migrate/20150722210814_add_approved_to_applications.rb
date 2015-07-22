class AddApprovedToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :approval, :boolean, default: false
  end
end
