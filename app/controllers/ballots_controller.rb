class BallotsController < ApplicationController
  def new
    @ballot = Ballot.new
    #@ballot.Selection<< Selection.new
    #@ballot.Selection<< Selection.new
    #@ballot.Selection<< Selection.new
    @ballot.selection.build
    @ballot.selection.build
    @ballot.selection.build
    
  end
  
  def show
    @ballot = Ballot.find(params[:id])
  end
  
  def create
    @ballot = Ballot.new(ballot_params)
    if(@ballot.save)
      redirect_to(@ballot)
    else 
      render 'new'
    end
  end
  

  
  def edit
    @ballot = Ballot.find(params[:id])
  end
  
  private
    def ballot_params
      params.require(:ballot).permit(:electioneer, :name, selection_attributes: [:name])
    end
    
end
