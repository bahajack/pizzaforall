class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.string :menu_type
      t.string :size
      t.decimal :price
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
