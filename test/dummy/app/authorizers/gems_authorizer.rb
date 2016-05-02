class GemsAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # { id: authenticated.gem_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # { id: authenticated.gem_ids }
  end

  def create
    # true
  end

  def update
    # true
    # { id: authenticated.gem_ids }
  end

  def destroy
    # true
    # { id: authenticated.gem_ids }
  end

end
