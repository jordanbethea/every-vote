class FullVote < ActiveRecord::Base
  belongs_to :ballot
  has_one :single_vote_model
  accepts_nested_attributes_for :single_vote_model
  
  has_one :approval_vote_model
  accepts_nested_attributes_for :approval_vote_model
end
