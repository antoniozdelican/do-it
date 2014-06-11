class Item < ActiveRecord::Base
  belongs_to :category
  enumeration :status
  validates :name, :status_id, presence: true
end
