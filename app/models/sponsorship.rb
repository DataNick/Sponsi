class Sponsorship < ActiveRecord::Base
  belongs_to :user #Admin
  has_many :rewards
  has_many :applications

  validates_associated :rewards
  accepts_nested_attributes_for :rewards, :allow_destroy => true

end
