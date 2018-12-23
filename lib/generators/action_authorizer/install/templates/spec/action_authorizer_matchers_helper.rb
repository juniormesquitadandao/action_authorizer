RSpec::Matchers.define :be_authorized do |action, params = {}|
  match do |current_user|
    controller = described_class.to_s.underscore.gsub('_authorizer', '')
    ActionAuthorizer::Base.authorized?(current_user, controller, action, params)
  end
end

RSpec::Matchers.define :be_unauthorized do |action, params = {}|
  match do |current_user|
    controller = described_class.to_s.underscore.gsub('_authorizer', '')
    !ActionAuthorizer::Base.authorized?(current_user, controller, action, params)
  end
end
