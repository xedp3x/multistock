class DevicesController < ApplicationController
  # GET /devices
  # GET /devices.json
  def index
    
    if not params[:such].nil? and not params[:such][0][:name] == ""
      where = ""
      i = 0
      params[:such].each { |e|
        if not e[:name] == ''      
          i = i + 1  
          
          if not where == ""
            if params[:such_or] 
              where = where + ' OR '
            else
              where = where + ' AND '
            end
          end
          where = where + "(name = '"+e[:name]+"' and text like '%"+e[:text]+"%')"
        end  
      }
      
      @such = params[:such]
      @devices = Device.find_by_sql "select devices.* from devices, (select device_id from comments where #{where} group by device_id) as comments where comments.device_id = devices.id" 
    else
      @devices = Device.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])
    @place = @device.place

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(params[:device])

    respond_to do |format|
      if @device.save
        format.html { redirect_to :controller => "devices", :action => "edit", :id => @device.id }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to :controller => "devices", :action => "edit", :id => @device.id }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end
end
