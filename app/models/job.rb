class Job < ApplicationRecord
	belongs_to :client
	belongs_to :user
	has_many :job_categories
	has_many :categories, through: :job_categories

	accepts_nested_attributes_for :categories





end