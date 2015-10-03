# User Model
class User
  include Mongoid::Document
  field :userID, type: Integer

  embeds_many :artists
  embeds_many :user_tags
  embeds_many :user_recommendations

  has_and_belongs_to_many :friends, class_name: 'User'
end
