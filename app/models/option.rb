class Option
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :college_name, type: String
  field :branch, type: String
  field :attempt_id, type: String
  
  belongs_to :attempt
  
end
