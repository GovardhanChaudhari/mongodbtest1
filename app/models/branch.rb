class Branch
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  
  field :college_id, type: String
  
  belongs_to :college
  
  has_many :cutoffs, :dependent => :delete
  
end
