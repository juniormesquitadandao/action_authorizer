RSpec::Matchers.define :authorize do |current_user|
  match do
    described_class.new(current_user, @params.to_h).send(@action)
  end

  chain :access do |action|
    @action = action
  end

  chain :with do |params|
    @params = param
  end
end
