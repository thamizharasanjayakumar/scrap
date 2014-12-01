class AddCenterNameToTests < ActiveRecord::Migration
  def change
    add_column :tests, :center_name, :string
  end
end
