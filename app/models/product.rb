class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true

	has_many :orders_products
	has_many :products_ingredients
	has_many :ingredients, :through => :products_ingredients

	accepts_nested_attributes_for :products_ingredients
end
