class Sponsorship < ActiveRecord::Base
  belongs_to :user #Admin
  has_many :rewards
  has_many :applications
end
