class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.for current_user
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(params[:product].merge(user_id: current_user.id))
    @product.save
    respond_with(@product)
  end

  def update
    @product.update_attributes(params[:product])
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
