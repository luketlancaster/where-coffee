class AddBrewMethodsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :drip, :boolean
    add_column :shops, :btc, :boolean
  end
end
