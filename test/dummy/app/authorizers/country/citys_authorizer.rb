class Country::CitysAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # { id: authenticated.country_city_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # { id: authenticated.country_city_ids }
  end

  def create
    # true
  end

  def update
    # true
    # { id: authenticated.country_city_ids }
  end

  def destroy
    # true
    # { id: authenticated.country_city_ids }
  end

end
