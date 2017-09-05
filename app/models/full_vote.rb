class FullVote < ActiveRecord::Base
  belongs_to :ballot
  has_one :single_vote_model
  accepts_nested_attributes_for :single_vote_model
end
