class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /
  # GET /.json
  def index
    @products = Product.all
  end

end
