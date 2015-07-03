class Sponsorship < ActiveRecord::Base
  belongs_to :user #Admin
  has_many :rewards
  has_many :applications, through: :rewards

  validates_associated :rewards
  accepts_nested_attributes_for :rewards, :allow_destroy => true

end
