class ApplicationController < ActionController::Base
  include ActionAuthorizer::Config

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authorize!, if: :authorizer_controller?

  # def authenticated
  #   current_user
  # end

  # def respond_unauthorized_on_production_environment
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end

  private

  def authorizer_controller?
    controller_path == 'devise/registrations' || !devise_controller?
  end
end
