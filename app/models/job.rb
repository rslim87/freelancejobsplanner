class Job < ApplicationRecord
	belongs_to :client
	belongs_to :user
	has_many :job_categories
	has_many :categories, through: :job_categories


	validates :name, :jobdate, :payrate, presence: true
	validates :name, uniqueness: true

	accepts_nested_attributes_for :categories

	scope :jobdate_sort, -> { order("JOBDATE ASC")}


	def categories_attributes=(category_attributes)
    	category_attributes.values.each do |category_attribute|
    		category = Category.find_or_create_by(category_attribute)
      		self.categories << category
    	end
  	end
end