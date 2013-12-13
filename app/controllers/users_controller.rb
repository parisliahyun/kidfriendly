class UsersController < ApplicationController
   before_filter :set_user

   def index
      @users = User.all
    render :index
   end

  def show
    @user = User.find(params[:id])
    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new
    @activities = Activity.where(vendor_id: [current_user.id])

    # display history of booked activities:
    # @appointments = Appointment.where(vendor_id: [current_user.id])
    # loop through appointments and:
    # <% @client = User.find_by(id: [appointment.client_id.to_i]) %>
    # @client.name
    render :show
  end

  private

  def set_user
    @user = current_user
  end

end  