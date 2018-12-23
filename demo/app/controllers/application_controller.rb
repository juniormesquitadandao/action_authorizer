class ApplicationController < ActionController::Base
  include ActionAuthorizer
  before_action :authenticate_user!
  before_action :authorize!, unless: :devise_controller?
end
