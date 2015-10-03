# User Recommendations Model
class UserRecommendation
  include Mongoid::Document
  field :artistID, type: Integer
  field :sum_artist_weight, type: Integer
  field :total_listeners_count, type: Integer

  embedded_in :user
end
