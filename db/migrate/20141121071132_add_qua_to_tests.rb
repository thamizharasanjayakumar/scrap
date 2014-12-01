class AddQuaToTests < ActiveRecord::Migration
  def change
    add_column :tests, :qua, :string
  end
end
