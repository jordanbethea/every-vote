class Ballot < ActiveRecord::Base
    has_many :selection
    has_many :full_vote
    accepts_nested_attributes_for :selection, allow_destroy: true
end
