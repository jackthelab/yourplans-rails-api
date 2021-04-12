class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.references :bid, null: false, foreign_key: true
      t.references :bid_response, null: false, foreign_key: true
      t.boolean :complete

      t.timestamps
    end
  end
end
