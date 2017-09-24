class CreateApprovalVoteModels < ActiveRecord::Migration
  def change
    create_table :approval_vote_models do |t|

      t.references :full_vote, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
