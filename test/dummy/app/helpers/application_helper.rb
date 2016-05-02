module ApplicationHelper

  # Add helpers to check authorization authenticated.
  # def unauthorized? controller, action, params = {}
  # def authorized? controller, action, params = {}
  # ex.:
  #   authozired? :gems, :index
  #   authozired? 'gems', 'index'
  #   authozired? 'dashborad/gems', 'index'
  #   authozired? :gems, :show, id: 1
  #   authozired? :gems, :show, id: '1'
  include ActionAuthorizer::Helper

  # def authenticated
  #   current_user
  # end

end