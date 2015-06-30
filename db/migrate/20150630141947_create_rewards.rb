class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :number_of_goods
      t.string :good
      t.references :sponsorship, index: true

      t.timestamps
    end
  end
end
