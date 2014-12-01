class AddRecToTests < ActiveRecord::Migration
  def change
    add_column :tests, :rec, :integer
  end
end
