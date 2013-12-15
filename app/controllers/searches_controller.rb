class SearchesController < ApplicationController

  def new
    @activities = Activity.all
    render :new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @schedules = Schedule.all
    @activity = Activity.all
    @activity = Activity.find(params[:id])
    @appointment.activity_id = @activity.activity_id
    @appointment.client_id = current_user.client_id
    @appointment.vendor_id = @activity.vendor_id
    render :results
  end

  def index 
    redirect_to new_search_path
  end 

  private

  def appointment_params
    params.require(:appointment).permit(:client_id, :vendor_id, :activity_id, :date, :start, :finish, :price)
  end

end