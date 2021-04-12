class CreateBidResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :bid_responses do |t|
      t.references :business, null: false, foreign_key: true
      t.references :bid, null: false, foreign_key: true
      t.integer :price
      t.string :category
      t.text :details

      t.timestamps
    end
  end
end
