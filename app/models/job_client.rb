class JobClient < ApplicationRecord
	belongs_to :job 
	belongs_to :client 

end