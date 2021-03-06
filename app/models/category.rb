class Category < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id}
end
