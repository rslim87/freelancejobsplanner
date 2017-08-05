class ClientSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :street, :apt, :borough, :notes, :user_id
  has_many :jobs
  belongs_to :user
end
