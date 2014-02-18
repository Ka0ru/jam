class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true

	has_many :orders_products
	has_many :products_ingredients
end
