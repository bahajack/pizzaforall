class Customer < ApplicationRecord
 validates :name, presence: true
 validates :phone,  presence: true
 validates :phone, numericality: { only_integer: true }
 validates :phone, length: { is: 10}
 validates :address, presence: true

end
