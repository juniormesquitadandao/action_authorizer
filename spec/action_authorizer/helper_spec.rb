RSpec.describe 'Helper' do

  let(:helper) { ApplicationHelper.new }

  it { expect(helper).to be_is_a ActionAuthorizer::Helper }

  it '#authenticated' do
    expect(helper).to receive(:current_user)
    helper.authenticated
  end

  it '#authorized?' do
    expect(helper).to receive(:unauthorized?).with(:controller, :action, {key: 'value'})
    helper.authorized? :controller, :action, {key: 'value'}
  end

  it '#unauthorized?' do
    expect(WelcomeAuthorizer).to receive(:new).with(nil, :index, {id: 1}){ double('WelcomeAuthorizer', unauthorized?: true) }
    helper.unauthorized? :welcome, :index, id: 1
  end

end