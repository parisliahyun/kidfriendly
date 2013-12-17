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
  @basic_profile = get_basic_profile
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

  def get_basic_profile
    bprofile = BasicProfile.find_by_user_id(current_user.id)
    if bprofile.nil?
      client = get_client
      profile = client.profile(:fields => ["first-name", "last-name", "maiden-name", "formatted-name" ,:headline, :location, :industry, :summary, :specialties, "picture-url", "public-profile-url"])

      basic_profile = profile.to_hash
      basic_profile[:location] = basic_profile["location"]["name"]
      new_basic_profile = BasicProfile.new(basic_profile)
      new_basic_profile.user = current_user
      new_basic_profile.save 
      new_basic_profile
    else
      bprofile
    end
  end

end  