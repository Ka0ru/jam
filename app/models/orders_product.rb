class OrdersProduct < ActiveRecord::Base
	validates :id_order, presence: true
	validates :id_product, presence: true
	validates :quantity, presence: true

	belongs_to :order, :product
end
