require File.expand_path('../application_controller', __FILE__)

class WelcomeController < ApplicationController

  def index
  end

  def controller_path
    'welcome'
  end

  def action_name
    'index'
  end

  def params
    {}
  end

end