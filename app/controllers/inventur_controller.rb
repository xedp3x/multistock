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
    if params[:filter].nil?
      params[:filter] = 0
    end
    if params[:filter] == 0
      @devices= Device.find_all_by_place_id(params[:place])
    else
      @devices= Device.find(:all,
       :joins => [" LEFT JOIN (select * from comments where name = 'last-seen') as comments on (comments.device_id = devices.id)"], 
       :conditions => [ "place_id = ? and (UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(text) > ? or text is null)", params[:place], params[:filter]]) 
    end 
  end
  
  def report
     require 'barby'
     require 'barby/barcode/ean_8'
     require 'barby/outputter/ascii_outputter'

     @no_menu= true;

     @place= Place.find params[:place]
     @devices= Device.find_all_by_place_id(params[:place])

  end
    
  
end
