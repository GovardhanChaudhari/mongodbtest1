class Attempt
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :score, type: Integer
  field :subscription_id, type: String
  
  has_many :options
  
  has_many :results , :class_name => "Option"
  
  belongs_to :subscription
  
end
