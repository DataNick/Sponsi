class AddRewardIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :reward_id, :integer
  end
end
