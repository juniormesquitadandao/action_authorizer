class Devise::RegistrationsAuthorizer < ApplicationAuthorizer
  # All actions automatically validating the need of user logged.
  # Skip this check for all actions:
  # skip_authentication
  # Or skip_authentication_only for some actions:
  # skip_authentication_only :index, :new, :destroy, ...

  def index
    # true
  end

  def show
    # true
    # DeviseRegistration.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.devise_registration_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # DeviseRegistration.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.devise_registration_ids }
  end

  def create
    # true
  end

  def update
    # true
    # DeviseRegistration.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.devise_registration_ids }
  end

  def destroy
    # true
    # DeviseRegistration.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.devise_registration_ids }
  end

end