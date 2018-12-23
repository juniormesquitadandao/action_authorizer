class ThoughtsAuthorizer < ApplicationAuthorizer
  def index
    true
  end

  def show
    true
  end

  def new
    true
  end

  def edit
    current_user.thoughts.exists?(id: params[:id])
  end

  def create
    true
  end

  def update
    current_user.thoughts.exists?(id: params[:id])
  end

  def destroy
    current_user.thoughts.exists?(id: params[:id])
  end
end