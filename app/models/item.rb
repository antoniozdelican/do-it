class Item < ActiveRecord::Base
  belongs_to :category
  enumeration :status
  validates :name, :deadline, presence: true
end
