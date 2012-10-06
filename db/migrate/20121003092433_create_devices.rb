class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, :options => 'AUTO_INCREAMENT=1000001' do |t|
      # ID nach EAN-8

      t.integer :place_id

      t.timestamps
    end
  end
end
