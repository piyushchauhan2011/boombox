class Comment
  include Mongoid::Document
  field :description, type: String

  embedded_in :person
end
