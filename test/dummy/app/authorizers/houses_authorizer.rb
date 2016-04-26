class HousesAuthorizer < ApplicationAuthorizer
  # All methods below can be used in all authorizers.

  # Skip the following parameters for all requests [:utf8, :_method, :authenticity_token, :commit].
  # skip_default_params

  # Authorize the predefined actions with their respective parameters.
  # authorize_default_params

  # Specify which parameters you want to skip all requests.
  # def skiped_params
  #   [:param_one, :param_two, ...]
  # end

  # Specify which parameters you want to use for each action.
  def authorize_default_params
    {
      index: {},
      show: {
        id: @user.house_ids
      },
      new: nil,
      edit: {
        id: @user.house_ids
      },
      create: {},
      update: {
        id: @user.house_ids,
        house: {}
      },
      destroy: {
        id: @user.house_ids
      }
    }
  end
end