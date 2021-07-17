class Store < ApplicationRecord
  belongs_to :menu

  validates :store_name, presence: true
  validates :order_type,  presence: true
  validates :store_address, presence: true
end
