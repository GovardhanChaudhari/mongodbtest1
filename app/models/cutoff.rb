class Cutoff
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :round, type: String
  field :shift, type: String
  field :caste, type: String
  field :male_score, type: Integer
  field :female_score, type: Integer
  field :male_sml_rank, type: Integer
  field :female_sml_rank, type: Integer
  
  field :male_score_ou, type: Integer
  field :female_score_ou, type: Integer
  field :male_sml_rank_ou, type: Integer
  field :female_sml_rank_ou, type: Integer
  
  field :aieee_rank, type: Integer
  field :aieee_score, type: Integer
  
  field :branch_id, type: String
  
  belongs_to :branch
  
  
end
