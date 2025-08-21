class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    suggestions_path
  end
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    # サインアップ時に nickname を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    # アカウント編集時にも許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
