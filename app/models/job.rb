class Job < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :job_clients
	has_many :clients, through: :job_clients

=begin	def paid
		if self.paid == true
			 "yes"
		else
			 "no"
		end
	end=end

end