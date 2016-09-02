require File.expand_path('../application_controller', __FILE__)

class SkipAllController < ApplicationController

  def index
  end

  def controller_path
    'skip_all'
  end

  def action_name
    'index'
  end

  def params
    {}
  end

end