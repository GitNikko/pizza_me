class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :pcode
      t.string :suburb
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
