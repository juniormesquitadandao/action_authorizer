require File.expand_path('../../application_controller', __FILE__)

class Dashboard::AdminsController < ApplicationController

  def index
  end

  def controller_path
    'dashboard/admins'
  end

  def action_name
    'index'
  end

  def params
    {}
  end

end