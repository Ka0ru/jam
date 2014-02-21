class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.integer :id_order
      t.integer :id_product
      t.integer :quantity

      t.timestamps
    end
  end
end
