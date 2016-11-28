class CreateFoodies < ActiveRecord::Migration
  def change
    create_table :foodies do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user_name
      t.string :password

      t.timestamps null: false
    end
  end
end
