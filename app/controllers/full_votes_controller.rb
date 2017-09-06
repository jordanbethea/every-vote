class FullVotesController < ApplicationController
    def new
        @ballot = Ballot.find(params[:ballot_id])
        @vote = @ballot.full_vote.build
        @singleVote = @vote.build_single_vote_model
        @approvalVote = @vote.build_approval_vote_model
    end
    
    def create
        @ballot = Ballot.find(params[:ballot_id])
        @vote = @ballot.full_vote.build
        @singleVote = @vote.build_single_vote_model
        @approvalVote = @vote.build_approval_vote_model
        
        @singleVote.selection_id = params[:single_vote_model][:selection_id]
        
        approvalVotes = params[:approval_vote_model][:selection_id]
        
        approvalVotes.each do |approval|
           @approvalVote.approval_entry.build(selection_id: approval) 
        end

        if(@ballot.save)
            redirect_to action: 'index', ballot_id: @ballot.id
        else
            render 'new'
        end
    end
    
    def index
        @ballot = Ballot.find(params[:ballot_id])
        @singleCounts = Hash.new(0)
        @approvals = Hash.new(0)
                
        @ballot.full_vote.each do |vote|
           vote.single_vote_model.selection_name = Selection.find(vote.single_vote_model.selection_id).name 
           @singleCounts[vote.single_vote_model.selection_name] += 1
           
           vote.approval_vote_model.approval_entry.each do |approval|
              approval.selection_name = Selection.find(vote.single_vote_model.selection_id).name
              @approvals[approval.selection_name] += 1
           end
        end
        
        
        
        
    end

    
end