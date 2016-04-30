class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :authorize!, unless: :devise_controller?

  include ActionAuthorizer

  # def authenticated
  #   current_user
  # end

  # def unauthorized_response_on_production
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end

end