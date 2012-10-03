class Device < ActiveRecord::Base 
  belongs_to  :owner
  belongs_to  :place
  
  has_many    :comment
end
