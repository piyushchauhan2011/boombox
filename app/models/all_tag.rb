class AllTag
  include Mongoid::Document
  field :tagID, type: Integer
  field :tag_value, type: String
end
