class ProductsController < ApplicationController
  skip_before_filter :authenticate_user!

  # GET /
  # GET /.json
  def index
    @products = Product.all
  end

end
