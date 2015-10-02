class User
  include Mongoid::Document
  field :userID, type: Integer

  has_and_belongs_to_many :artists, dependent: :nullify
  recursively_embeds_many
end
