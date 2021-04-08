class Destination < ApplicationRecord
  has_many :products
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :references

  validates :name, presence: true, uniqueness: true
end
