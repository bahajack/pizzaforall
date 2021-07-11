class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_address
      t.string :order_type
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
