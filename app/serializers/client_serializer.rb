class ClientSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :street, :apt, :borough, :notes, :user_id
end
