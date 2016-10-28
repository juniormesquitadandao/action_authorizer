class UsersController < ApplicationController
  before_filter :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.for current_user
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    @user.save
    respond_with(@user)
  end

  def update
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
