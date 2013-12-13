class CalendarController < ApplicationController
  def show
     @activities_by_date = Activity.all_by_date
  end
end

