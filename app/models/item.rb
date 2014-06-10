class Item < ActiveRecord::Base
  belongs_to :category
  validates :name, :deadline, presence: true
end
