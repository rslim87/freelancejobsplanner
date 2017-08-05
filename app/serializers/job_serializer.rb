class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :jobdate, :payrate, :paid, :equipment, :user_id, :client_id
end
