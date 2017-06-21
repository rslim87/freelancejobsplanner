class Client < ApplicationRecord
	belongs_to :user
	has_many :job_clients
	has_many :jobs, through: :job_clients
end