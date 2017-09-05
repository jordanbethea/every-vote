class SingleVoteModel < ActiveRecord::Base
  belongs_to :full_vote
  
  attr_accessor :selection_name
end
