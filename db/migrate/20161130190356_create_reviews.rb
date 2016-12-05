class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :latitude
      t.float :longitude
      t.string :restaurant_name
      t.string :cuisine
      t.string :dish
      t.float :price
      t.integer :rating
      t.string :street
      t.string :city
      t.string :state
      t.string :postalcode
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
