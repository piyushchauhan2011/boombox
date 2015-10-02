class Tag
  include Mongoid::Document
  field :tagID, type: Integer
  field :tag_value, type: String
  field :timestamp, type: Date
  embedded_in :artist
end
