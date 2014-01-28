class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include SessionsHelper
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:image_url, :name, :role]
    devise_parameter_sanitizer.for(:account_update) << [:name, :image_url, :role, :skills, :interests, :about, :tag_list, :availability, :certifications] 
  end

  def after_sign_in_path_for(resource)
    new_search_path
  end
end


