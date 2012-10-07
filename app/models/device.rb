class Device < ActiveRecord::Base 
  attr_accessible :place_id
  
  belongs_to  :place
  
  has_many    :comment
end
