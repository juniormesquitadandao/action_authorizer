require File.expand_path('../application_controller', __FILE__)

class OtherController < ApplicationController

  def index
  end

  def controller_path
    'other'
  end

  def action_name
    'index'
  end

  def params
    {}
  end

end