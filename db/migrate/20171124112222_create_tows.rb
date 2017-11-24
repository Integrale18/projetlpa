class CreateTows < ActiveRecord::Migration
  def change
    create_table :tows do |t|
      t.string :name
      t.float :lon
      t.float :lat

      t.timestamps
    end
  end
end
