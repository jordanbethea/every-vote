class CreateSingleVoteModels < ActiveRecord::Migration
  def change
    create_table :single_vote_models do |t|
      t.references :FullVote, index: true, foreign_key: true
      t.references :Selection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
