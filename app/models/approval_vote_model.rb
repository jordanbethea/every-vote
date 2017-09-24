class ApprovalVoteModel < ActiveRecord::Base
    has_many :approval_entry
    accepts_nested_attributes_for :approval_entry
    
    belongs_to :full_vote
end
