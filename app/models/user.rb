class User < ActiveRecord::Base
	validates :login, presence: true, length: { minimum: 3 }
	validates :password, presence: true, length: { minimum: 8 }
	validates :email, presence: true
end
