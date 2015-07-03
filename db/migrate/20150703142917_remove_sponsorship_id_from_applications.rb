class RemoveSponsorshipIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :sponsorship_id, :integer
  end
end
