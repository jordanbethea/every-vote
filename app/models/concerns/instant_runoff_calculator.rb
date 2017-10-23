class InstantRunoffCalculator
    #Instant runoff is a ranked voting calculation method
    #Runs FPPT for all top selections - if one has over 50%, they win
    #If not, last place choice is eliminated, and voters remaining top choices are used
    #continue cycling through until majority is found, possibly once only two choices are left
    
    attr_reader :rankedVotes
    attr_reader :results
    attr_reader :winningSelection
    def initialize
        #TODO - should change these to use unique model classes, this is getting cumbersome
        @rankedVotes = {}  # vote id => [ {rank, selection}, {rank, selection}]
        @results = []      # array of rounds: [ {selection => count}, {selection => count}]
        @ballotID = nil
        @winningSelection = nil
        @possibleSelections = []
    end
    
    def importRankedVotes(ballot)
        @rankedVotes = {}
        @ballotID = ballot.id
        ballot.selection.each do |selection|
           @possibleSelections.push(selection) 
        end
        ballot.full_vote.each do |vote|
            rankings = []
            vote.ranked_vote_model.ranking.each do |ranking|
                if(ranking.rank != nil)
                    rankings.push({rank: ranking.rank, selection: ranking.selection})
                end
            end
            rankings.sort!{|a,b| a[:rank] <=> b[:rank]}
            @rankedVotes[vote.id] = rankings
        end
    end
    
    def tallyVotes
        roundCount = 0
        winner = false
        toBeat = @rankedVotes.length / 2
        until(winner)
            roundVotes = Hash.new(0)
            @possibleSelections.each do |sel|
               roundVotes[sel] = 0    #adding individually so that even selections with no votes have a key
            end
            #count up current highest rated votes
            @rankedVotes.each do |voteID, rankings|
                highRank = rankings.first
                if(highRank != nil)
                    topChoice = highRank.fetch(:selection)
                    roundVotes[topChoice] = roundVotes[topChoice] + 1
                    #roundVotes[rankings[:selection]] = roundVotes[rankings[:selection]] + 1
                end
            end
            @results[roundCount] = roundVotes
            #check if a selection gets a majority
            roundVotes.each do |selectionID, voteTotal|
               if voteTotal > toBeat
                   winner = true
                   @winningSelection = selectionID
               end
            end
            if !winner and @possibleSelections.length == 1
               winner = true
               @winningSelection = @possibleSelections.first
            end
            
            if(!winner) # remove the lowest place vote getter (and any ties) (actually, not ties, to prevent possible tie deadlocks for small vote counts)
                lowestCount = toBeat
                #find lowest vote count
                roundVotes.each do |selection_id, count|
                    if(count < lowestCount) 
                        lowestCount = count
                    end
                end
                lowestIDs = []
                #find ids that received lowest vote count
                roundVotes.keys.each do |key|
                   if(roundVotes[key] == lowestCount)
                       lowestIDs.push(key)
                       break
                   end
                end
                #TODO - add in check for if there is tie between all remaining candidates
                #If so, pick one at random to remove
                
                #remove rankings for those ids
                @rankedVotes.each_value do |vote|
                   vote.delete_if {|ranking| lowestIDs.include?(ranking[:selection]) }
                end
                lowestIDs.each do |sel|
                   @possibleSelections.delete(sel) 
                end
                roundCount += 1
            end #end of no winner handler
        end #end of until winner loop
        
    end #end of tallyVotes
    
    
end