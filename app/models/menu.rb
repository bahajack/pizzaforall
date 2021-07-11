class Menu < ApplicationRecord
  has_and_belongs_to_many :orders
  has_many :stores
  has_many :toppings
end
