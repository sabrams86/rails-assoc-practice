class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.datetime :date_purchased
      t.string :condition
      t.string :brand
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
