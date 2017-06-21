class User < ApplicationRecord
	
	has_many :clients
	has_many :jobs

	has_secure_password

end