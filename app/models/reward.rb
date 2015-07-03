class Reward < ActiveRecord::Base
  belongs_to :sponsorship
  has_many :applications


end
