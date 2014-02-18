class CreateProductsIngredients < ActiveRecord::Migration
  def change
    create_table :products_ingredients do |t|
      t.integer :id_product
      t.integer :id_ingredient
      t.float :nb_ingredient

      t.timestamps
    end
  end
end
