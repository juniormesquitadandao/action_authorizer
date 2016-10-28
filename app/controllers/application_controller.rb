class ApplicationController < ActionController::Base
  include ActionAuthorizer::Config

  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :authorize!, if: :authorizer_controller?

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
