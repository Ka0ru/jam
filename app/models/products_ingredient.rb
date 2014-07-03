class ProductsIngredient < ActiveRecord::Base
	#validates :product_id, presence: true
	#validates :ingredient_id, presence: true
	#validates :nb_ingredient, presence: true

	belongs_to :product
	belongs_to :ingredient

	accepts_nested_attributes_for :ingredient
end
