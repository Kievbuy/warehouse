class Product < ApplicationRecord
  belongs_to :category
  belongs_to :reference, optional: true
  belongs_to :destination

  validates :name, presence: true
end
