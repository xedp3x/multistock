class AutocompleteController < ApplicationController
  respond_to :js

  def comments
      @comments = Comment.find(:all, :conditions => ['name LIKE ?', "%#{params[:term]}%"], :group => "name", :order => "count(*) DESC", :limit => 10)
      render :json => @comments
  end
  
  def places
      @places = Place.find(:all, :conditions => ['name LIKE ?', "%#{params[:term]}%"], :group => "name", :order => "name ASC", :limit => 10)
      render :json => @places
  end
end
