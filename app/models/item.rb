class Item < ActiveRecord::Base
  belongs_to :category
  enumeration :status
  validates :name, presence: true, uniqueness: true
  validates :status_id, presence: true
end
