class WelcomeController < ApplicationController
  # GET /
  # GET /.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  private

  def authenticate_user!
  end
end
