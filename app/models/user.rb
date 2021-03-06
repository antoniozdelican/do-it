class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :categories, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  
  def email_required?
  	false
  end
end