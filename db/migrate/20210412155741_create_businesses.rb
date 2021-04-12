class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :linkedin
      t.text :bio

      t.timestamps
    end
  end
end
