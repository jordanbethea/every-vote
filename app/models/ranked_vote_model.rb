class RankedVoteModel < ActiveRecord::Base
    belongs_to :full_vote
    has_many :ranking
    accepts_nested_attributes_for :ranking
    
    validates_associated :ranking
    validates_with RankingValidator
    
    #Takes all rankings and normalizes them so that rank value is always 1...x for x rankings, in order
    #goal is to prevent gaps in ranking numbers
    #not working yet....ignore
    def normalizeRankings
        setRankings = []
        ranking.each do |allRanking|
            if(allRanking.rank != nil)
                setRankings.push(allRanking)
            end
        end
        
        #setRankings = ranking.where.not(:rank => nil)
        setRankings.order(:rank, :desc)
        setRankings.each_with_index do |iterationRanking, index|
            iterationRanking.rank = index + 1
        end
    end
end
