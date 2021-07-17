class Menu < ApplicationRecord
  has_and_belongs_to_many :orders
  has_many :stores
  has_many :toppings

  validates :menu_name, presence: true
  validates :menu_type,  presence: true
  validates :size,  presence: true
  validates :price, presence: true
  validates :price, numericality: { only_decimal: true }
end
