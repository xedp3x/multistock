class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :chat
      t.text :contact

      t.timestamps
    end
  end
end
