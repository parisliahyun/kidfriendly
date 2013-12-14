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
    @activity.vendor_id = current_user.id
    if @activity.save  
      redirect_to activity_path(@activity.id)
    else
      render :new  
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @commentable = @activity
    @comments = @commentable.comments
    @comment = Comment.new
    @vendor = User.find_by(id: [@activity.vendor_id.to_i])
    render :show
  end

  def index
    @activities = Activity.all
    render :index
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
      params.require(:activity).permit(:scheduled_at, :image_url, :description, :tags, :price, :vendor_id)
  end

end
