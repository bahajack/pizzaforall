class Order < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :menus

  validates :product_name, presence: true

  validates :product_count,  presence: true

  validates_associated :customer

  #validates_associated :menu

end
