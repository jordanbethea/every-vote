class CreateSingleVoteModels < ActiveRecord::Migration
  def change
    create_table :single_vote_models do |t|
      t.integer :selection_id
      t.references :full_vote, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
