class ProductsAuthorizer < ApplicationAuthorizer

  def index
    true
  end

  def show
    true
  end

  def new
    !authenticated.admin?
  end

  def edit
    !authenticated.admin? && { id: authenticated.product_ids }
  end

  def create
    !authenticated.admin?
  end

  def update
    !authenticated.admin? && { id: authenticated.product_ids }
  end

  def destroy
    !authenticated.admin? && { id: authenticated.product_ids }
  end

end