class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    describes_path
  end

  def after_sign_out_path_for(resource)
    describes_path
  end

  def set_search
    @q = Describe.ransack(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image, :receive])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :receive])
  end
end
