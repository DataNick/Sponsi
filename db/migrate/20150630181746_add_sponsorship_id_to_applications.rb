class AddSponsorshipIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :sponsorship_id, :integer
  end
end
