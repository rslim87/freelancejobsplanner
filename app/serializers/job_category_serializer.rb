class JobCategorySerializer < ActiveModel::Serializer
  attributes :id, :job_id, :category_id
  belongs_to :job
  belongs_to :category
end
