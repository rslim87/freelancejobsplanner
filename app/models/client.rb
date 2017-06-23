class Client < ApplicationRecord
	belongs_to :user
	has_many :jobs, inverse_of: :clients



end