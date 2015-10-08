# All Tag Model
class AllTag
  include Mongoid::Document
  field :tagID, type: Integer
  field :tag_value, type: String

  index 'tagID' => 1
  index 'tag_value' => 1
end
