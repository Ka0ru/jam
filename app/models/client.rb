class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
	validates :email, length: { minimum: 3 }, :uniqueness => true
	validates :telephone, :numericaliity => true
	validates :street, presence: true, length: { minimum: 3 }
	validates :zip_code, presence: true, length: { minimum: 5 }
	validates :city, presence: true, length: { minimum: 3 }
	validates :country, presence: true, length: { minimum: 2 }

	has_many :orders
end
