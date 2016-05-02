require File.expand_path('../../routing_error', __FILE__)

class ApplicationController

  def env
    {
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/'
    }
  end

  include ActionAuthorizer::Config

  def current_user
  end

  def render options
  end

end