class User < ApplicationRecord
	
	has_many :clients
	has_many :jobs

	has_secure_password

	validates :password, presence: true,
                         confirmation: true,
                         length: {minimum: 8, message: "must be at least 8 characters"}
    validates :email, :name, presence: true
    validates :email, uniqueness: true
    

	require 'securerandom'
	
	def self.create_with_omniauth(auth)
	    create! do |user|
	        user.provider = auth.provider
	        user.uid = auth.uid
	        user.name = auth.info.name
	        user.password = SecureRandom.urlsafe_base64
	        user.oauth_token = auth.credentials.token
      		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    end
	end

end