https://onebitcode.com/rails-concerns

# Action Authorizer

[![Gem Version](https://badge.fury.io/rb/action_authorizer.svg)](https://badge.fury.io/rb/action_authorizer)
[![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=1.3.0)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)

Rails authorization with controllers's actions.

ActionAuthorizer is a gem to authorize the controllers's actions. Designed to work with RSpec and Devise. Where each controller will have an authorizer with the same actions. Each authorizer's action will return permission's result.

## Tested against Rails >= 3.0 and Ruby >= 1.9

  - Rails 3.0 and Ruby 1.9
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-3.0)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)
  - Rails 3.1 and Ruby 1.9
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-3.1)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)
  - Rails 3.2 and Ruby 2.0
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-3.2)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)
  - Rails 4.0 and Ruby 2.0
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-4.0)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)
  - Rails 4.1 and Ruby 2.1
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-4.1)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)
  - Rails 4.2 and Ruby 2.2
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-4.2)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)
  - Rails 5.0 and Ruby 2.3
  [![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=rails-5.0)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)

## Getting Started

After setting up Rspec and Devise! Set up ActionAuthorizer.

- Edit: Gemfile
```ruby
gem 'action_authorizer', '~> 1.3'
```

- Run
```console
bundle install
rails generate action_authorizer:install
```

- Edit: app/controllers/application_controller.rb
```ruby
class ApplicationController < ActionController::Base
  include ActionAuthorizer
  ...
  before_action :authenticate_user!
  before_action :authorize!, unless: :devise_controller?
end
```

- Edit: spec/rails_helper.rb
```ruby
RSpec.configure do |config|
  # Controllers Spec with ActionAuthorizer
  config.before :each, type: :controller do
    allow(controller).to receive(:authorize!)
  end

  # Views Spec with ActionAuthorizer
  # case rails < 3.1
  # config.before :each, type: :view do
  #   view.extend ActionAuthorizerHelper
  # end
end
```

### Authorizing models with module

- Run
```console
rails generate action_authorizer:authorizer namespace/model
```

### Authorizing models without module

- Run
```console
rails generate action_authorizer:authorizer model
```

## Authorizing Account's Record or Cancellation (Optional)

- Edit: app/controllers/application_controller.rb
```ruby
class ApplicationController < ActionController::Base
  include ActionAuthorizer::Config
  ...
  before_action :authenticate_user!
  before_action :authorize!, if: :authorizer_controller?

  private

  def authorizer_controller?
    controller_path == 'devise/registrations' || !devise_controller?
  end
end
```

- Edit: /app/views/devise/registrations/edit.html.erb
```ruby
<% if authorized? 'devise/registrations', :cancel %>
<h3>Cancel my account</h3>

<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>
<% end %>
```

- Edit: /app/views/devise/shared/_links.html.erb
```ruby
<%- if devise_mapping.registerable? && controller_name != 'registrations' %>
  <%= link_to "Sign up", new_registration_path(resource_name) if authorized? 'devise/registrations', :new %><br />
<% end -%>
```

- Run
```console
rails generate action_authorizer:authorizer devise/registration
```

- Edit: app/authorizers/devise/registrations_authorizer.rb
```ruby
class Devise::RegistrationsAuthorizer < ApplicationAuthorizer
  skip_authentication only: %i[new create]

  # Account registration page
  def new
  end

  # Account edition page
  def edit
    true
  end

  # Account registration submition
  def create
  end

  # Account edition submition
  def update
    true
  end

  # Account cancellation page
  def destroy
  end

  # Account cancellation submition
  def cancel
  end

end
```

- Edit: /spec/authorizers/devise/registrations_authorizer_spec.rb
```ruby
require 'rails_helper'

RSpec.describe Devise::RegistrationsAuthorizer, type: :authorizer do
  let(:guest_user) { nil }
  let(:user) { double('User') }

  describe '#new' do
    context 'when not authorize' do
      it { expect(described_class.new(user)).not_to be_new }
      it { expect(described_class.new(guest_user)).not_to be_new }
    end
  end

  describe '#edit' do
    context 'when authorize' do
      it { expect(described_class.new(user)).to be_edit }
    end

    context 'when not authorize' do
      it { expect(described_class.new(guest_user)).not_to be_edit }
    end
  end

  describe '#create' do
    context 'when not authorize' do
      it { expect(described_class.new(user).not_to be_create }
      it { expect(described_class.new(guest_user).not_to be_create }
    end
  end

  describe '#update' do
    context 'when authorize' do
      it { expect(described_class.new(user)).to be_update }
    end

    describe 'not authorize' do
      it { expect(described_class.new(guest_user)).not_to be_update }
    end
  end

  describe '#destroy' do
    context 'when not authorize' do
      it { expect(described_class.new(user)).not_to be_destroy }
      it { expect(described_class.new(guest_user)).not_to be_destroy }
    end
  end

  describe '#cancel' do
    context 'when not authorize' do
      it { expect(described_class.new(user)).not_to be_cancel }
      it { expect(described_class.new(guest_user)).not_to be_cancel }
    end
  end
end
```
# Extras
## Helpers

- Edit: app/helpers/action_authorizer_helper.rb
```ruby
def authozired_controller? controller, action, params = {}
  ActionAuthorizer::Base.authorized?(current_user, controller, action, params)
end
```
### How To
- Edit: app/views/models/show.json.jbuilder
```ruby
json.add model2_path(@model) if authozired_controller? :model2, :add, model: @model
```
## Specs
- Edit: spec/action_authorizer_matchers_helper.rb
```ruby
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
```
- Edit: spec/rails_helper.rb
```ruby
require 'action_authorizer_matchers_helper'
```
### How To
- Edit: spec/authorizers/models_authorizer_spec.rb
```ruby
require 'rails_helper'

RSpec.describe ModelsAuthorizer, type: :authorizer do
  let(:guest_user) { nil }
  let(:one_user) { double('Authenticated', user_group?: true, model_ids: [1]) }
  let(:two_user) { double('Authenticated', user_group?: true, model_ids: [2]) }
  let(:admin_user) { double('Authenticated', admin_group?: true) }

  describe '#index' do
    context 'authorize' do
      it { expect.to authorize(one_user).access(:index) }
      it { expect.to authorize(two_user).access(:index) }
      it { expect.to authorize(admin_user).access(:index) }
    end

    context 'not authorize' do
      it { expect.not_to authorize(guest_user).access(:index) }
    end
  end

  describe '#show' do
    context 'when authorize' do
      it { expect.to authorize(one_user).access(:show).with(id: 1) }
      it { expect.to authorize(two_user).access(:show).with(id: 2) }
      it { expect.to authorize(admin_user).access(:show).with(id: 1) }
      it { expect.to authorize(admin_user).access(:show).with(id: 2) }
    end

    context 'when not authorize' do
      it { expect.not_to authorize(guest_user).access(:show).with(id: 1) }
      it { expect.not_to authorize(one_user).access(:show).with(id: 2) }
      it { expect.not_to authorize(two_user).access(:show).with(id: 1) }
    end
  end

  describe '#new' do
    context 'when authorize' do
      it { expect.to authorize(one_user).access(:new) }
      it { expect.to authorize(two_user).access(:new) }
      it { expect.to authorize(admin_user).access(:new) }
    end

    context 'when not authorize' do
      it { expect.not_to authorize(guest_user).access(:new) }
    end
  end

  describe '#edit' do
    context 'when authorize' do
      it { expect.to authorize(one_user).access(:edit).with(id: 1) }
      it { expect.to authorize(two_user).access(:edit).with(id: 2) }
      it { expect.to authorize(admin_user).access(:edit).with(id: 1) }
      it { expect.to authorize(admin_user).access(:edit).with(id: 2) }
    end

    context 'when not authorize' do
      it { expect.not_to authorize(guest_user).access(:edit).with(id: 1) }
      it { expect.not_to authorize(one_user).access(:edit).with(id: 2) }
      it { expect.not_to authorize(two_user).access(:edit).with(id: 1) }
    end
  end

  describe '#create' do
    context 'when authorize' do
      it { expect.to authorize(one_user).access(:create) }
      it { expect.to authorize(two_user).access(:create) }
      it { expect.to authorize(admin_user).access(:create) }
    end

    context 'when not authorize' do
      it { expect.not_to authorize(guest_user).access(:create) }
    end
  end

  describe '#update' do
    context 'when authorize' do
      it { expect.to authorize(one_user).access(:update).with(id: 1) }
      it { expect.to authorize(two_user).access(:update).with(id: 2) }
      it { expect.to authorize(admin_user).access(:update).with(id: 1) }
      it { expect.to authorize(admin_user).access(:update).with(id: 2) }
    end

    context 'when not authorize' do
      it { expect.not_to authorize(guest_user).access(:update).with(id: 1) }
      it { expect.not_to authorize(one_user).access(:update).with(id: 2) }
      it { expect.not_to authorize(two_user).access(:update).with(id: 1) }
    end
  end

  describe '#destroy' do
    context 'when authorize' do
      it { expect.to authorize(one_user).access(:destroy).with(id: 1) }
      it { expect.to authorize(two_user).access(:destroy).with(id: 2) }
      it { expect.to authorize(admin_user).access(:destroy).with(id: 1) }
      it { expect.to authorize(admin_user).access(:destroy).with(id: 2) }
    end

    context 'when not authorize' do
      it { expect.not_to authorize(guest_user).access(:destroy).with(id: 1) }
      it { expect.not_to authorize(one_user).access(:destroy).with(id: 2) }
      it { expect.not_to authorize(two_user).access(:destroy).with(id: 1) }
    end
  end
end
```
