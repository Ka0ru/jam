class CreateProductsIngredients < ActiveRecord::Migration
  def change
    create_table :products_ingredients do |t|
      t.integer :product_id
      t.integer :ingredient_id
      t.float :nb_ingredient

      t.timestamps
    end
  end
end
