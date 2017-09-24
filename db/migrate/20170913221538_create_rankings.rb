class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :rank
      t.references :ranked_vote_model, index: true, foreign_key: true
      t.references :selection, foreign_key: true

      t.timestamps null: false
    end
  end
end
