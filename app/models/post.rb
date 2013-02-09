class Post
  include Mongoid::Document
  field :name, type: String
  field :data, type: String
end
