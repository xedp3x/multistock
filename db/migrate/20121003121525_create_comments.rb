class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :text

      t.integer :device_id

      t.timestamps
    end
  end
end
