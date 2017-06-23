class Job < ApplicationRecord
	belongs_to :client, inverse_of: :jobs
	belongs_to :user
	has_many :job_categories
	has_many :categories, through: :job_categories

	accepts_nested_attributes_for :categories
	accepts_nested_attributes_for :client






end