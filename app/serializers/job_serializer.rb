class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :jobdate, :payrate, :paid, :equipment, :user_id, :client_id
  belongs_to :client
  belongs_to :user

  has_many :categories, through: :job_categories
end
