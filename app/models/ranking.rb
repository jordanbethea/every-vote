class Ranking < ActiveRecord::Base
    belongs_to :selection
    belongs_to :ranked_vote_model
    
    validates :rank, numericality: {only_integer:true, greater_than:0, 
        allow_nil: true,message: "Rank must be a whole number greater than 0"}
    validates :selection, presence: true
end
