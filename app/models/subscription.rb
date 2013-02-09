class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id, type: String
  
  belongs_to :user
  has_many :attempts
  
end
