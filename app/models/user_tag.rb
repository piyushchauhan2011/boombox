# Embedded User Tags Model
class UserTag
  include Mongoid::Document
  field :tagID, type: Integer
  field :tag_value, type: String
  field :timestamp, type: Date

  embedded_in :user

  index 'tagID' => 1
end
