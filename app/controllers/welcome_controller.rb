class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

end
