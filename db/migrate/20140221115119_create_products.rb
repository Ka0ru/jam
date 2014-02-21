class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :photo
      t.float :price
      t.float :margin
      t.text :description

      t.timestamps
    end
  end
end
