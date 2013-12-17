class SearchesController < ApplicationController

  def new
    @activities = Activity.all
    render :new
  end

  def create
    @activities = Activity.all
    @matching_activities = Activity.where(id: params[:id])
    render :results
      # render "no activities are available for this time."
  end

  def index 
    redirect_to new_search_path
  end 


end