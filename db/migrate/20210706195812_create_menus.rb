class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :pizza
      t.string :wings
      t.string :sides
      t.string :drinks
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
