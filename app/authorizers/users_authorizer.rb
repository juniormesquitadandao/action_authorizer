class UsersAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # User.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.user_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # User.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.user_ids }
  end

  def create
    # true
  end

  def update
    # true
    # User.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.user_ids }
  end

  def destroy
    # true
    # User.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.user_ids }
  end

end