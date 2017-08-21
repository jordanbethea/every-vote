class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.string :electioneer

      t.timestamps null: false
    end
  end
end
