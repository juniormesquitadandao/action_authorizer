class Devise::RegistrationsAuthorizer < ApplicationAuthorizer

  skip_authentication_only :new, :create

  def new
    false
  end

  def edit
    true
  end

  def create
    false
  end

  def update
    true
  end

  def destroy
    true
  end

  def cancel
    true
  end

end