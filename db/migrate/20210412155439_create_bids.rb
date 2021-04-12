class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :city
      t.string :state
      t.integer :budget
      t.integer :num_in_party
      t.text :notes
      t.boolean :open_status
      t.date :date

      t.timestamps
    end
  end
end
