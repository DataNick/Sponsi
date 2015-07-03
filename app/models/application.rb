class Application < ActiveRecord::Base

belongs_to :user
belongs_to :sponsorship
has_many :rewards, through: :sponsorship


end
