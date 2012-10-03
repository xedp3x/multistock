class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.float :lat
      t.float :lon

      t.integer :place_type_id

      t.timestamps
    end
  end
end
