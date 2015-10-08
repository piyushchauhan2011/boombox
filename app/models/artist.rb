# Artist Model
class Artist
  include Mongoid::Document
  field :artistID, type: Integer
  field :weight, type: Integer

  embedded_in :user

  index 'artistID' => 1
end
