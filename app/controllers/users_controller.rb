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
  @activities = Activity.where(vendor_id: [@user.id])
  @basic_profile = BasicProfile.find_by(user_id: [@user.id])
  # @appointments = Appointment.where(client_id: [@user.id]) 
  render :show
end

private

def set_user
  @user = current_user
end

def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.username = auth.info.nickname
  end
end

def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end
end

def password_required?
  super && provider.blank?
end

def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end

end  