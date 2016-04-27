class ActionAuthorizer::Base

  def initialize(action, params)
    @action = action
    @params = params
  end

  def authorized?
    @result = send(@action)
    if !@result.kind_of?(Hash) || @params.empty?
      @result.present?
    else
      authorize?
    end
  end

  private

  def authorize?
    unauthorized = @result.select do |name, values|
      param_value = @params[name].to_s
      param_value.present? && values.map!{|v| v.to_s}.exclude?(param_value)
    end
    unauthorized.empty?
  end

end