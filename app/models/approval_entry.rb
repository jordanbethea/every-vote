class ApprovalEntry < ActiveRecord::Base
    belongs_to :approval_vote_model
    belongs_to :selection
    
    attr_accessor :selection_name
end
