require 'action_authorizer/result_error.rb'

class ActionAuthorizer::Base
  attr_reader :current_user, :params

  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def skip?(action)
    false
  end

  class << self
    def authorized?(current_user, controller, action, params)
      authorizer = "#{controller}_authorizer".classify.constantize.new(current_user, params)
      result = (authorizer.skip?(action) || !!current_user&.persisted?) && authorizer.respond_to?(action.to_sym) && authorizer.send(action.to_sym)
      raise ActionAuthorizer::ResultError.new(result) if [true, false].exclude?(result)
      result
    end

    def skip_authentication(only: nil)
      define_method(:skip?) do |action|
        only.blank? || [only].compact.flatten.map!(&:to_sym).include?(action.to_sym)
      end
    end
  end
end
