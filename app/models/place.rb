class Place < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :lat, :lon
  
  belongs_to  :place_type
  has_many    :device
end
