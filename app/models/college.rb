class College
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :code, type: String
  field :area, type: String
  field :city, type: String
  
  has_many :branches , :dependent => :delete
  
end
