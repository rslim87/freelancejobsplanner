class Job < ApplicationRecord
	has_one :client
	belongs_to :user
	has_many :job_categories
	has_many :categories, through: :job_categories

	accepts_nested_attributes_for :categories
	accepts_nested_attributes_for :client



  def categories_attributes=(category_attributes)
  	category_attributes.values.each do |category_attribute|
  		category = Category.find_or_create_by(category_attribute)
  		self.categories << category
  	end
  end


end