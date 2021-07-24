class CreateJoinTableOrderMenu < ActiveRecord::Migration[5.2]
  def change
    create_join_table :orders, :menus do |t|
       t.index [:order_id, :menu_id]
       t.index [:menu_id, :order_id]
    end
  end
end
