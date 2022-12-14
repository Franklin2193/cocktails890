class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Siempre antes de entrar a cualquier pagina debe estar autentificado
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:email, :password, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
