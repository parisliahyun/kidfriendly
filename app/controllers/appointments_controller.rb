class AppointmentsController < ApplicationController

  def show
  end

  def index
  end

  def new
  end

  def create

    @appointment = Appointment.create(appointment_params)
    @activity = Activity.find(params[:id])
    @appointment.activity_id = @activity.activity_id
    @appointment.client_id = current_user.client_id
    @appointment.vendor_id = @activity.vendor_id
  end

   private

   def appointment_params
      params.require(:appointment).permit(:client_id, :vendor_id, :activity_id, :date, :start, :finish, :price)
   end
end