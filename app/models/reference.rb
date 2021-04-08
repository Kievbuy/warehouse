class Reference < ApplicationRecord
  has_many :products
  has_and_belongs_to_many :destinations

  validates :name, presence: true, uniqueness: true
end
