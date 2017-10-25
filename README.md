# Every Vote
This is a website for showing people all of the different voting methods that there are, and letting them make their own ballots and poll their friends on different things. It could be on where you want to go for lunch, or something else.
There are no logins, and currently all data is shared, so please don't put anything on here you don't want people seeing.

The test version is available at https://every-vote-76957.herokuapp.com/

I used this project to teach myself Ruby and Rails, so it is not especially optimized.

# Completed Functionality

* Ballot creation (3 items only)
* Vote creation
* First Past the Post (Single Vote) model and functionality
* Approval vote (choose all approved options) model and functionality
* Ranking (Ordinal) vote model (rank options in order)
  * Instant Runoff calculator
* Basic html interface for all of the above

# To be Done
* Allow addition of more than 3 items to a ballot
* More Ranking model calculators
  * Borda Count
  * Bucklin System
  * Coombs Method
  * Contingent Vote
* Redo Instant Runoff to use cleaner code
* Cardinal Vote model (Ratings from 1-10, independent values)
  * Range voting
  * Majority Judgment
* Make results page prettier, add more styling
* Add javascript to enable show/hide of each model results, and of raw result data.
* Javascript drag and drop ranking instead of typing numbers
* Add UUID to each ballot so that people can set to private, so only people with the correct link can access ballot
* Add ability to send email out with link to request them to vote
* Add pretty charts to results page
* Change result calculation for complicated models so that they are calculated on demand and then stored, not on each page load
