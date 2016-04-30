class UsersAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # { id: authenticated.user_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # { id: authenticated.user_ids }
  end

  def create
    # true
  end

  def update
    # true
    # { id: authenticated.user_ids }
  end

  def destroy
    # true
    # { id: authenticated.user_ids }
  end

end
