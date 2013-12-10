class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
    render :new
  end

  def update
  end

  def create
    @activities = Activity.all
    @activity = Activity.new(activity_params)  
    if @activity.save  
      redirect_to activity_path(@activity)
    else
      render :new  
    end
  end

  def show
    @activity = Activity.find(params[:id])
    render :show
  end

  def index
    @activities = Activity.all
    render :index
  end

  def confirm
    @activity = Activity.find(params[:id])
    @activity.requester_id = current_user.id
    @activity.save!
    redirect_to user_path(current_user)
  end

  def claim
    @activity = Activity.find(params[:id])
    @activity.vendor_id = current_user.id
    current_user.role = "vendor"
    current_user.save!
    @activity.save!
    redirect_to user_path(current_user)
  end

  def destroy
   @activity = Activity.find(params[:id])
    if @activity.destroy
      redirect_to user_path(current_user)
    else 
      render :new
    end
  end
    
  private

  def activity_params
      params.require(:activity).permit(:image_url, :description, :tags, :price)
  end

end
