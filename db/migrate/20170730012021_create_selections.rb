class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :name
      t.integer :order
      t.references :ballot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
