class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :id_client
      t.float :price

      t.timestamps
    end
  end
end
