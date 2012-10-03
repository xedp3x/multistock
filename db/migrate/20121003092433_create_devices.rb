class CreateDevices < ActiveRecord::Migration
  def change
    create_table (:devices, :options => 'AUTO_INCREAMENT=10000001') do |t|

      t.integer :owner_id
      t.integer :place_id

      t.timestamps
    end
  end
end
