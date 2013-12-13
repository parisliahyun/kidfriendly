class SchedulesController < ApplicationController

  def new
     @schedule = Schedule.new
     render :new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save  
      redirect_to user_schedule_path(@schedule.id)
    else
      render :new  
    end
  end

  def index
    @schedules = Schedule.all

    render :index
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :from_date, :from_time, :to_date, :to_time, :repeats_every_n_weeks)
  end

end