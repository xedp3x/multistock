class Comment < ActiveRecord::Base
  attr_accessible :name, :text, :device_id
  
  belongs_to  :device
end
