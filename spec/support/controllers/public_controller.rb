require File.expand_path('../application_controller', __FILE__)

class PublicController < ApplicationController

  def index
  end

  def controller_path
    'public'
  end

  def action_name
    'index'
  end

  def params
    {}
  end

end