require 'test_helper'

class InstantRunoffCalculatorTest < ActiveSupport::TestCase
    
    
    # Rankings from yml:
    # Ballot 1 - 1,2,3,4
    # Ballot 2 - 3,1,2,4
    # Ballot 3 - 2,1,4,3
    # Ballot 4 - 2,3,4,1
    # Ballot 5 - 3,4,2,1
    
    #Expected Results:
    #Round 1 - 2 and 3 at 40%, 1 at 20%, 4 at 0. Eliminate 4.
    #Round 2 - Same result as round 1. Eliminate 1.
    #Round 3 - 2 at 60%, 3 at 40%. 2 wins.
    
    
  test "Breakfast ranking IRV results" do
      irv = new InstantRunoffCalculator
      testBallot = Ballot(:breakfast)
      
      irv.importRankedVotes(testBallot)
      irv.tallyVotes
      
      assert_equal 2,irv.winningSelection, "Winning selection was not selection 2"
      assert_equal 3,irv.results.length, "Number of rounds of voting was not 3"
      
  end
  
end
