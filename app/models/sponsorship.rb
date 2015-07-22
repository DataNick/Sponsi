class Sponsorship < ActiveRecord::Base
  belongs_to :user #Admin
  has_many :rewards, :dependent => :destroy 
  has_many :applications

  validates_associated :rewards
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

end
