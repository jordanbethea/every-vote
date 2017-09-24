class CreateRankedVoteModels < ActiveRecord::Migration
  def change
    create_table :ranked_vote_models do |t|
      t.references :full_vote, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
