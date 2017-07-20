class Item < ApplicationRecord
  belongs_to :user
  validates :name, length: { minimum: 5 }, presence: true
end
