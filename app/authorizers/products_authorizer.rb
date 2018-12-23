class ProductsAuthorizer < ApplicationAuthorizer
  skip_authentication
  # skip_authentication only: :index
  # skip_authentication only: %i[index show]

  def index
    true
  end

  def show
    true
  end
end
