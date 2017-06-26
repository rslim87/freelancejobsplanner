class Client < ApplicationRecord
	belongs_to :user
	has_many :jobs

	validates :name, :streetaddress, :borough, presence: true
	validates :name, uniqueness: true

	scope :sort_by_borough, -> { order("BOROUGH ASC")}


end