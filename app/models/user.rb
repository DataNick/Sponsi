class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :applications
  has_many :rewards, through: :applications
  has_many :sponsorships #Admin

  has_attached_file :avatar, :styles => { :large => "800x500", :medium => "300x300>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  protected
  def confirmation_required?
    false
  end

end
