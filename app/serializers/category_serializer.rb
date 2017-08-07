class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :job_categories
  has_many :jobs, through: :job_categories
end
