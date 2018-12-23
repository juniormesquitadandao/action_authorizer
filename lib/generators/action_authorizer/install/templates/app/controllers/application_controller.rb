class ApplicationController < ActionController::Base
  include ActionAuthorizer
  before_action :authorize!
end
