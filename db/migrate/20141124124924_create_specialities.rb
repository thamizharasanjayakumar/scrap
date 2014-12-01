class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.integer :test_id
      t.string :spec

      t.timestamps null: false
    end
  end
end
