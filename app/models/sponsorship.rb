class Sponsorship < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :applications through: :rewards
end
