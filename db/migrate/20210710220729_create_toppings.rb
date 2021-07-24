class CreateToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :toppings do |t|
      t.string :topping_name
      t.decimal :topping_price
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
