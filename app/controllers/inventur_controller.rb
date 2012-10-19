class InventurController < ApplicationController
  def index
  end
  
  def scan
    @device= nil
    if not params[:such].nil?
      @device= Device.find_by_ean params[:such]
    end 
    if not @device.nil?
      c= @device.comment.find_or_create_by_name("last-seen")
      c.text= Time.now
      c.save
      @device.place_id= params[:place]
      @device.save
    end
  end
  
  def list
    @devices= Device.find_all_by_place_id(params[:place])
  end
  
end
