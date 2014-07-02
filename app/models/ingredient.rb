class Ingredient < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true

	has_many :products_ingredients
	has_many :products, :through => :products_ingredients
end
