class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :experience, null: false, foreign_key: true
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
