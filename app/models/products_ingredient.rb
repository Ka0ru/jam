class ProductsIngredient < ActiveRecord::Base
	validates :id_product, presence: true
	validates :id_ingredient, presence: true
	validates :nb_ingredient, presence: true

	belongs_to :product, :ingredient
end
