class CreateApprovalEntries < ActiveRecord::Migration
  def change
    create_table :approval_entries do |t|
      t.references :selection
      t.references :approval_vote_model, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
