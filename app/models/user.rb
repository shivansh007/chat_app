class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/, message: "Invalid email" }
	validates :password, presence: true, allow_nil: true, length: { in: 6..20 }
end
