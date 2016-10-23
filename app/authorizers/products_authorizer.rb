class ProductsAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # Product.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.product_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # Product.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.product_ids }
  end

  def create
    # true
  end

  def update
    # true
    # Product.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.product_ids }
  end

  def destroy
    # true
    # Product.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.product_ids }
  end

end