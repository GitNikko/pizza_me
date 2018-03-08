class AddGoogleIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :google_id, :string
  end
end
