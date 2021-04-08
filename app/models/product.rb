class Product < ApplicationRecord
  belongs_to :category
  belongs_to :reference
  belongs_to :destination

  validates :name, presence: true, uniqueness: true
end
