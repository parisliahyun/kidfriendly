class SearchesController < ApplicationController

  def new
    @activities = Activity.all
    render :new
  end

  def create
    
    @activities = Activity.all
    @activity = Activity.find(params[:id])
    @selected_tag = Activity.find(params[:tag_list])
    @appointment = Appointment.create(appointment_params)
    @schedules = Schedule.all
    @appointment.activity_id = @activity.activity_id
    @appointment.client_id = current_user.client_id
    @appointment.vendor_id = @activity.vendor_id
    @schedules = Schedule.all
    @users = User.all 
    @user = User.find(params[:id])
    @schedule = Schedule.find(params[:id])
    # @schedules.each do |schedule|
    # @matching_schedules = []
    #   if params[:from_date] == schedule.from_date
    #     @matching_schedules << schedule
    #   end  
    # end  
    # if params[":from_date"] == "2013-12-31"
      render :results
      # binding.pry
      # render "no activities are available for this time."
  end

  def index 
    redirect_to new_search_path
  end 


end