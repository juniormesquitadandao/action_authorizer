# Action Authorizer

[![Gem Version](https://badge.fury.io/rb/action_authorizer.svg)](https://badge.fury.io/rb/action_authorizer)
[![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=v2)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)

Rails authorization with controllers's actions.

ActionAuthorizer is a gem to authorize the controllers's actions. Designed to work with RSpec and Devise. Where each controller will have an authorizer with the same actions. Each authorizer's action will return permission's result.

```erb
<% if authorized? :new %>
  <a hre="<%= new_model_path %>">New</a>
<% end %>
```

## Getting Started

After setting up Rspec and Devise! Set up ActionAuthorizer.

- Edit: Gemfile
```ruby
gem 'action_authorizer', '~> 2.0'
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
  ...
  private
  ...
  def authorize!
    unauthorize! unless authorized?
  end

  def authorized?
    ActionAuthorizer::Base.authorized?(current_user, controller_path, action_name, params.except(:controller, :action))
  end

  def unauthorize!
    if request.format.json?
      render(json: {status: 404, error: 'Not Found'}, status: :not_found)
    elsif Rails.env.production?
      render(file: Rails.root.join('public/404'), layout: false, status: :not_found)
    else
      raise(ActionController::RoutingError, "No route matches [#{request.env['REQUEST_METHOD']}] #{request.env['PATH_INFO'].inspect}")
    end
  end
end
```

- Edit: spec/rails_helper.rb
```ruby
require 'action_authorizer_matchers_helper'
...
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
```erb
<% if authorized? 'devise/registrations', :cancel %>
<h3>Cancel my account</h3>

<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>
<% end %>
```

- Edit: /app/views/devise/shared/_links.html.erb
```erb
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
      it { expect(user).to be_unauthorized(:new) }
      it { expect(guest_user).to be_unauthorized(:new) }
    end
  end

  describe '#edit' do
    context 'when authorize' do
      it { expect(user).to be_authorized(:edit) }
    end

    context 'when not authorize' do
      it { expect(guest_user).to be_unauthorized(:edit) }
    end
  end

  describe '#create' do
    context 'when not authorize' do
      it { expect(user).to be_unauthorized(:create) }
      it { expect(guest_user).to be_unauthorized(:create) }
    end
  end

  describe '#update' do
    context 'when authorize' do
      it { expect(user).to be_authorized(:update) }
    end

    describe 'not authorize' do
      it { expect(guest_user).to be_unauthorized(:update) }
    end
  end

  describe '#destroy' do
    context 'when not authorize' do
      it { expect(user).to be_unauthorized(:destroy) }
      it { expect(guest_user).to be_unauthorized(:destroy) }
    end
  end

  describe '#cancel' do
    context 'when not authorize' do
      it { expect(user).to be_unauthorized(:cancel) }
      it { expect(guest_user).to be_unauthorized(:cancel) }
    end
  end
end
```
