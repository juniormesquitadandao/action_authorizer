require File.expand_path('../application_controller', __FILE__)

class OtherPublicController < ApplicationController

  def index
  end

  def controller_path
    'other_public'
  end

  def action_name
    'index'
  end

  def params
    {}
  end

end