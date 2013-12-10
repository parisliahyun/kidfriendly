class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :image_url)}

    devise_parameter_sanitizer.for(:sign_up) << :image_url
    devise_parameter_sanitizer.for(:sign_up) << :name
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :image_url, :password)}
    devise_parameter_sanitizer.for(:account_update) << :name 
    devise_parameter_sanitizer.for(:account_update) << :image_url
  end
end


