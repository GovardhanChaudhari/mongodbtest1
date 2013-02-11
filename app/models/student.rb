class Student
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :caste, type: String
  field :aieee_rank, type: Integer
  field :sml_number, type: Integer
  field :uml_number, type: Integer
  field :university, type: String
  field :aieee_score, type: Integer
  field :mhcet_score, type: Integer
  field :caste_rank, type: Integer
  field :gender, type: String
  
  
  has_many :subscriptions
  
  
end
