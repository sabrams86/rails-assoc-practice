class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password
      t.string :email
      t.datetime :date_joined
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
