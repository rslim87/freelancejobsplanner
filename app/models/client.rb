class Client < ApplicationRecord
	belongs_to :user
	has_many :jobs

	scope :sort_by_borough, -> { order("BOROUGH ASC")}


end