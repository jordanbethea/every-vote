class SingleVoteModel < ActiveRecord::Base
  belongs_to :full_vote
  belongs_to :selection
  
  attr_accessor :selection_name
  validates :selection, presence: {message: "You must select an item for the single vote."}
end
