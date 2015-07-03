class AddApplicationIdToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :application_id, :integer
  end
end
