class AddAddressToTests < ActiveRecord::Migration
  def change
    add_column :tests, :address, :string
  end
end
