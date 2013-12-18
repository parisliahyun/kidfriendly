class AppointmentsController < ApplicationController

  def show
    @appointment = Appointment.find(params[:id])
  end

  def index
    @appointments = Appointment.all
  end

  def new
  end

  def create
    # binding.pry
    @appointment = Appointment.new(activity_id: params[:id])
    @appointment.activity_id = params[:id]
    @activity = Activity.find_by(id: params[:activity_id])
    @appointment.vendor_id = @activity.vendor_id
    @appointment.client_id = current_user.id
    if @appointment.save
      redirect_to new_charge_path
    end
  end

   private

   # def appointment_params
   #    params.require(:appointment).permit(:activity_id, :vendor_id, :client_id)
   # end

end