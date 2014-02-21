class Order < ActiveRecord::Base
	validates :id_client, presence: true
	validates :price, presence: true

	belongs_to :client
	has_many :orders_products
end
