class Reward < ActiveRecord::Base
  belongs_to :sponsorship
  belongs_to :users
end
