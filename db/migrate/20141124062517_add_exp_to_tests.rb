class AddExpToTests < ActiveRecord::Migration
  def change
    add_column :tests, :exp, :integer
  end
end
