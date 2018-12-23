class ApplicationController < ActionController::Base
  include ActionAuthorizer
  before_action :authenticate_user!
end
