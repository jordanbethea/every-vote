class Ballot < ActiveRecord::Base
    has_many :Selection
    has_many :FullVote
end
