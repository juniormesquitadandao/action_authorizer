class Country::CitiesAuthorizer < ApplicationAuthorizer

  def index
    @authenticated
  end

  def show
    @authenticated
    # { id: authenticated.country_city_ids }
  end

  def new
    @authenticated
  end

  def edit
    @authenticated
    # { id: authenticated.country_city_ids }
  end

  def create
    @authenticated
  end

  def update
    @authenticated
    # { id: authenticated.country_city_ids }
  end

  def destroy
    @authenticated
    # { id: authenticated.country_city_ids }
  end

end