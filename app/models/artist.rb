class Artist
  include Mongoid::Document
  field :artistID, type: Integer
  field :name, type: String
  field :url, type: String
  field :picture_url, type: String
  field :weight, type: Integer

  embeds_many :tags
  has_and_belongs_to_many :users, dependent: :nullify

end
