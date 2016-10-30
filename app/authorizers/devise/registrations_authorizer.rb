class Devise::RegistrationsAuthorizer < ApplicationAuthorizer
  skip_authentication_only :new, :create

  # Account registration page
  def new
  end

  # Account edition page
  def edit
    true
  end

  # Account registration submition
  def create
  end

  # Account edition submition
  def update
    true
  end

  # Account cancellation page
  def destroy
  end

  # Account cancellation submition
  def cancel
  end

end