class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.integer :item_id
      t.integer :owner
      t.integer :renter

      t.timestamps null: false
    end
  end
end
