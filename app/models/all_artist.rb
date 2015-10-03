# All Artist Model
class AllArtist
  include Mongoid::Document
  field :artistID, type: Integer
  field :name, type: String
  field :url, type: String
  field :picture_url, type: String

  # Fields for Global Recommendations
  field :sum_artist_weight, type: Integer
  field :total_listeners_count, type: Integer

  embeds_many :artist_tags
end
