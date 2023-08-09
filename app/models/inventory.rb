class Inventory < ApplicationRecord
  belongs_to :user
  attribute :description, :text

  validates :name, presence: true
end
