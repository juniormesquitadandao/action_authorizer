class ActionAuthorizer::Base

  def initialize(authenticated, action, params = {})
    @authenticated = authenticated
    @action = action.to_sym
    @params = params
  end

  def unauthorized?
    return true if !authenticated && !skip_all && skip.exclude?(action)

    @result = send(action)
    if !result.kind_of?(Hash)
      result.blank?
    elsif params.empty?
      false
    else
      unauthorized_params?
    end
  end

  def authorized?
    !unauthorized?
  end

  class << self
    def skip_all
      define_method(:skip_all) do
        true
      end
    end

    def skip *actions
      define_method(:skip) do
        actions
      end
    end
  end

  private

  attr_reader :authenticated, :params, :action, :result

  def unauthorized_params?
    unauthorized_params = result.select do |name, values|
      param_value = params[name].to_s
      param_value.present? && values.map!{|v| v.to_s}.exclude?(param_value)
    end
    unauthorized_params.any?
  end

  def skip_all
    false
  end

  def skip
    []
  end

end