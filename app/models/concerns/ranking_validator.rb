class RankingValidator < ActiveModel::Validator
    
    def validate(rankings)
        rankingVals = Set.new
        rankings.ranking.each do |ranking|
            if(ranking.rank != nil)
                if(rankingVals.include?(ranking.rank))
                    rankings.errors[:base] = "This ranking contains a duplicate value: "+ranking.rank.to_s
                else
                    rankingVals.add(ranking.rank)
                end
            end
        end
        
        rankingVals.length.times do |count|
            countAdj = count + 1 #times starts range at 0
            unless(rankingVals.member?(countAdj))
                rankings.errors[:base] = "This set of rankings skips the number "+countAdj.to_s+". Please add that ranking or remove later ones."
            end
        end
    end
end