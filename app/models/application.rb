class Application < ActiveRecord::Base

belongs_to :user
belongs_to :sponsorship
has_many :rewards, through: :sponsorship

# validates :name, :length => { :minimum => 2 }
# validates :sport, :length => { :minimum => 2 }
# validates :rank, presence: true
# validates :description, :length => { :minimum => 2 }
# validates :playing_at, :length => { :minimum => 2 }
# validates :looking_for, :length => { :minimum => 2 }
# validates :level, presence: true
# validates :best_result, :length => { :minimum => 2 }
# validates :age, presence: true
# validates :location, :length => { :minimum => 2 }

end
