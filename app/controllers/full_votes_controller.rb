class FullVotesController < ApplicationController
    def new
        @ballot = Ballot.find(params[:ballot_id])
        @vote = @ballot.full_vote.build
        @singleVote = @vote.build_single_vote_model
        #@singleVote = @vote.single_vote_model.build
    end
    
    def create
        @ballot = Ballot.find(params[:ballot_id])
        @vote = @ballot.full_vote.build
        @singleVote = @vote.build_single_vote_model
        @singleVote.selection_id = params[:single_vote_model][:selection_id]
        #@chosenSelection = Selection.find(params[:single_vote_model][:selection_id])
        #@singleVote.selection = @chosenSelection
        #@singleVote.build_selection(id: params[:single_vote_model][:selection_id])
        
        if(@ballot.save)
            redirect_to action: 'index', ballot_id: @ballot.id
        else
            render 'new'
        end
    end
    
    def index
        @ballot = Ballot.find(params[:ballot_id])
        @counts = Hash.new(0)
                
        @ballot.full_vote.each do |vote|
           vote.single_vote_model.selection_name = Selection.find(vote.single_vote_model.selection_id).name 
           @counts[vote.single_vote_model.selection_name] += 1
        end
        
        
    end

    
end