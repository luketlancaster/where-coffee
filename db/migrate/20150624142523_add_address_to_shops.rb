class AddAddressToShops < ActiveRecord::Migration
  def change
    add_column :shops, :address, :string
  end
end
