class CreateFullVotes < ActiveRecord::Migration
  def change
    create_table :full_votes do |t|
      t.string :name
      t.references :ballot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
