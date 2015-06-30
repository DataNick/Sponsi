class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.string :sport
      t.integer :level
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
