class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :student_id, type: String
  
  belongs_to :student
  has_many :attempts
  
end
