class Topping < ApplicationRecord
  belongs_to :menu

  validates :topping_name,  presence: true
  validates :topping_price, presence: true
  validates :topping_price, numericality: { only_decimal: true }

  #validates_associated :menu
end
