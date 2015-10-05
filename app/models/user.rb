# User Model
class User
  include Mongoid::Document
  field :userID, type: Integer

  embeds_many :artists
  embeds_many :user_tags
  embeds_many :user_recommendations

  has_and_belongs_to_many :friends, class_name: 'User'

  def generate_recommendation
    tmp = artists.map(&:artistID).to_a
    friends.each do |f|
      f.artists.not_in(artistID: tmp).each do |a|
        ur = user_recommendations.find_or_create_by(artistID: a.artistID)
        ur.sum_artist_weight += a.weight
        ur.total_listeners_count += 1
        ur.save
      end
    end
  end

  # def get_tag_recommendation
    # AllArtist.where('artist_tags.tagID' => rt.tagID).not_in(artistID: u.artists.map(&:artistID).to_a).desc(:total_listeners_count).take(5)
  # end

  # Answers
  # 1. u.user_recommendations.desc(:sum_artist_weight).take(5)
  # 2. u.user_recommendations.desc(:total_listeners_count).take(5)
  # 3. AllArtist.where('artist_tags.tagID' => rt.tagID).not_in(artistID: u.artists.map(&:artistID).to_a).desc(:total_listeners_count).take(5)
end
