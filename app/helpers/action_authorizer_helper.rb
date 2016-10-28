module ActionAuthorizerHelper
  # Add helpers to check authorization authenticated.
  # def unauthorized? controller, action, params = {}
  # def authorized? controller, action, params = {}
  # ex.:
  #   <%= link_to 'Models', models_path if authorized? :models, :index %>
  #   <%= link_to 'Models Dashboard', dashboard_models_path if authorized? 'dashborad/models', :index %>
  #   <%= link_to 'Model', model_path(@model) if authorized? :models, :show, id: @model.id %>
  #   <%= link_to 'Model', edit_model_path(@model) if authorized? :models, :edit, id: @model.to_param %>
  include ActionAuthorizer::Helper

  # def authenticated
  #   current_user
  # end
end
