class SingleVoteModel < ActiveRecord::Base
  belongs_to :FullVote
  has_one :Selection
end
