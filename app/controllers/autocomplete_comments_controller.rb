class AutocompleteCommentsController < ApplicationController
  respond_to :js

  def index
      @comments = Comment.find(:all, :conditions => ['name LIKE ?', "%#{params[:term]}%"], :group => "name", :order => "count(*) DESC", :limit => 10)
      render :json => @comments, :only => "name"
  end
end
