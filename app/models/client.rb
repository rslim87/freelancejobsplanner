class Client < ApplicationRecord
	belongs_to :user
	has_many :jobs

	validates :fullname, :street, :borough, presence: true
	validates :fullname, uniqueness: true

	scope :sort_by_borough, -> { order("BOROUGH ASC")}


end