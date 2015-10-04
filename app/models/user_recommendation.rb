# User Recommendations Model
class UserRecommendation
  include Mongoid::Document
  field :artistID, type: Integer
  field :sum_artist_weight, type: Integer, default: 0
  field :total_listeners_count, type: Integer, default: 0

  embedded_in :user
end
