# Action Authorizer

[![Gem Version](https://badge.fury.io/rb/action_authorizer.svg)](https://badge.fury.io/rb/action_authorizer)
[![Build Status](https://travis-ci.org/juniormesquitadandao/action_authorizer.svg?branch=1.3.0)](https://travis-ci.org/juniormesquitadandao/action_authorizer/branches)

Rails authorization with controllers's actions.

ActionAuthorizer is a gem to authorize the controllers's actions. Designed to work with RSpec and Devise. Where each controller will have an authorizer with the same actions. Each authorizer's action will return your permission's result.

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

After setting up your Rspec and Devise! Set up your ActionAuthorizer.

now configure your: Gemfile
```ruby
gem 'action_authorizer', '~> 1.3'
```

run
```console
bundle install
rails generate action_authorizer:install
```

it will be generated: app/authorizers/application_authorizer.rb
```ruby
class ApplicationAuthorizer < ActionAuthorizer::Base
end
```

it will be generated: app/helpers/action_authorizer_helper.rb
```ruby
module ActionAuthorizerHelper
  # Add helpers to check authorization authenticated.
  # def unauthorized? controller, action, params = {}
  # def authorized? controller, action, params = {}
  # ex.:
  #   <%= link_to 'Models', models_path if authorized? :models, :index %>
  #   <%= link_to 'Models Dashboard', dashboard_models_path if authorized? 'dashborad/models', :index %>
  #   <%= link_to 'Model', model_path(@model) if authorized? :models, :show, id: @model.id %>
  #   <%= link_to 'Model', edit_model_path(@model) if authorized? :models, :edit, id: @model.to_param %>
  #
  #   <%= link_to 'Models', models_path if unauthorized? :models, :index %>
  #   <%= link_to 'Models Dashboard', dashboard_models_path if unauthorized? 'dashborad/models', :index %>
  #   <%= link_to 'Model', model_path(@model) if unauthorized? :models, :show, id: @model.id %>
  #   <%= link_to 'Model', edit_model_path(@model) if unauthorized? :models, :edit, id: @model.to_param %>
  include ActionAuthorizer::Helper
  
  # def authenticated
  #   current_user
  # end
end
```

now configure your: spec/rails_helper.rb
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

now configure your: app/controllers/application_controller.rb
```ruby
class ApplicationController < ActionController::Base
  include ActionAuthorizer::Config

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authorize!, unless: :devise_controller?

  # def authenticated
  #   current_user
  # end

  # def respond_unauthorized_on_production_environment
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end
end
```

### Authorizing models with module

run
```console
rails generate action_authorizer:authorizer namespace/model
```

### Authorizing models without module

run
```console
rails generate action_authorizer:authorizer model
```

it will be generated: app/authorizers/models_authorizer.rb
```ruby
# Authorize reference controller actions when return:
#   Present values different hash:
#     ex.:
#       true
#       'nil'
#       'false'
#       0
#       '0'
#       [0]
#   Empty requested params:
#     ex. to requested params {}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#       { id: ['one', 'two'] }
#   A hash with key:values including requested params key:value:
#     ex. to requested params {id: 1, other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {id: 'one', other: 'three'}:
#       { id: ['one', 'two'] }
#   A hash with keys different requested params keys:
#     ex. to requested params {other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {other: 'three'}:
#       { id: ['one', 'two'] }
#
# Unauthorize reference controller actions when return:
#   Blank values different hash:
#     ex.:
#       nil
#       false
#       ''
#       ' '
#       []
#   A hash with key:values excluding requested params key:value:
#     ex. to requested params {id: 3, other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {id: 'three', other: 'three'}:
#       { id: ['one', 'two'] }
class ModelsAuthorizer < ApplicationAuthorizer
  # All actions automatically validating the need of user logged.
  # Skip this check for all actions:
  # skip_authentication
  # Or skip_authentication_only for some actions:
  # skip_authentication_only :index, :new, :destroy, ...

  def index
    # true
  end

  def show
    # true
    # Model.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.model_ids }
  end

  def new
    # true
    # Model.where(user: authenticated).find(params[:id]).avaliable?
  end

  def edit
    # true
    # Model.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.model_ids }
  end

  def create
    # true
    # Model.where(user: authenticated).find(params[:id]).avaliable?
  end

  def update
    # true
    # Model.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.model_ids }
  end

  def destroy
    # true
    # Model.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.model_ids }
  end

end
```

it will be generated: spec/authorizers/models_authorizer_spec.rb
```ruby
require 'rails_helper'

RSpec.describe ModelsAuthorizer, type: :authorizer do

  # let(:guest_user) { nil }
  # let(:one_user) { double('Authenticated', user_group?: true, model_ids: [1]) }
  # let(:two_user) { double('Authenticated', user_group?: true, model_ids: [2]) }
  # let(:admin_user) { double('Authenticated', admin_group?: true) }

  # context '#index' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :index)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :index)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :index)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :index)).to be_unauthorized }
  #   end
  # end

  # context '#show' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :show, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :show, id: 2)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :show, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :show, id: 2)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :show, id: 1)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(one_user, :show, id: 2)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :show, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#new' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :new)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :new)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :new)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :new)).to be_unauthorized }
  #   end
  # end

  # context '#edit' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :edit, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :edit, id: 2)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :edit, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :edit, id: 2)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :edit, id: 1)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(one_user, :edit, id: 2)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :edit, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#create' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :create)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :create)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :create)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :create)).to be_unauthorized }
  #   end
  # end

  # context '#update' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :update, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :update, id: 2)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :update, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :update, id: 2)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :update, id: 1)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(one_user, :update, id: 2)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :update, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#destroy' do
  #   describe 'authorize' do
  #     it { expect(ModelsAuthorizer.new(one_user, :destroy, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :destroy, id: 2)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :destroy, id: 1)).to be_authorized }
  #     it { expect(ModelsAuthorizer.new(admin_user, :destroy, id: 2)).to be_authorized }
  #   end
  #
  #   describe 'not authorize' do
  #     it { expect(ModelsAuthorizer.new(guest_user, :destroy, id: 1)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(one_user, :destroy, id: 2)).to be_unauthorized }
  #     it { expect(ModelsAuthorizer.new(two_user, :destroy, id: 1)).to be_unauthorized }
  #   end
  # end

end
```

## Authorizing Account's Record or Cancellation (Optional)

now edit your: app/controllers/application_controller.rb
```ruby
class ApplicationController < ActionController::Base
  include ActionAuthorizer::Config

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authorize!, if: :authorizer_controller?

  # def authenticated
  #   current_user
  # end

  # def respond_unauthorized_on_production_environment
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end

  private

  def authorizer_controller?
    controller_path == 'devise/registrations' || !devise_controller?
  end
end
```

now edit your: /app/views/devise/registrations/edit.html.erb
```ruby
<% if authorized? 'devise/registrations', :cancel %>
<h3>Cancel my account</h3>

<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>
<% end %>
```

now edit your: /app/views/devise/shared/_links.html.erb
```ruby
<%- if devise_mapping.registerable? && controller_name != 'registrations' %>
  <%= link_to "Sign up", new_registration_path(resource_name) if authorized? 'devise/registrations', :new %><br />
<% end -%>
```

run
```console
rails generate action_authorizer:authorizer devise/registration
```

now edit your: app/authorizers/devise/registrations_authorizer.rb
```ruby
class Devise::RegistrationsAuthorizer < ApplicationAuthorizer
  skip_authentication_only :new, :create

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

now edit your: /spec/authorizers/devise/registrations_authorizer_spec.rb
```ruby
require 'rails_helper'

RSpec.describe Devise::RegistrationsAuthorizer, type: :authorizer do

  let(:guest_user) { nil }
  let(:user) { double('Authenticated') }

  context '#new' do
    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :new)).to be_unauthorized }

      it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :new)).to be_unauthorized }
    end
  end

  context '#edit' do
    describe 'authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :edit)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :edit)).to be_unauthorized }
    end
  end

  context '#create' do
    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :create)).to be_unauthorized }

      it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :create)).to be_unauthorized }
    end
  end

  context '#update' do
    describe 'authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :update)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :update)).to be_unauthorized }
    end
  end

  context '#destroy' do
    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :destroy)).to be_unauthorized }

      it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :destroy)).to be_unauthorized }
    end
  end

  context '#cancel' do
    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :cancel)).to be_unauthorized }

      it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :cancel)).to be_unauthorized }
    end
  end

end
```
# Extras
## Helpers

file: app/helpers/action_authorizer_helper.rb
```ruby
def current_controller_authozired? action, _params = params
  authorized? controller_path, action, _params
end  
```
### How To
file: app/views/models/show.json.jbuilder
```ruby
json.destroy model_path(@model) if current_controller_authozired? :destroy
```
## Specs
file: spec/action_authorizer_matchers_helper.rb
```ruby
RSpec::Matchers.define :access do |action|
  match do |actual|
    actual.new(@authenticated, action, @params.to_h).authorized?
  end

  chain :by do |authenticated|
    @authenticated = authenticated
  end

  chain :with do |params|
    @params = param
  end
end
```
file: spec/rails_helper.rb
```ruby
require 'action_authorizer_matchers_helper'
```
### How To
file: spec/authorizers/models_authorizer_spec.rb
```ruby
require 'rails_helper'

RSpec.describe ModelsAuthorizer, type: :authorizer do

  # let(:guest_user) { nil }
  # let(:one_user) { double('Authenticated', user_group?: true, model_ids: [1]) }
  # let(:two_user) { double('Authenticated', user_group?: true, model_ids: [2]) }
  # let(:admin_user) { double('Authenticated', admin_group?: true) }

  # context '#index' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:index).by(one_user) }
  #     it { is_expected.to access(:index).by(two_user) }
  #     it { is_expected.to access(:index).by(admin_user) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:index).by(guest_user) }
  #   end
  # end

  # context '#show' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:show).by(one_user).with(id: 1) }
  #     it { is_expected.to access(:show).by(two_user).with(id: 2) }
  #     it { is_expected.to access(:show).by(admin_user).with(id: 1) }
  #     it { is_expected.to access(:show).by(admin_user).with(id: 2) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:show).by(guest_user).with(id: 1) }
  #     it { is_expected.not_to access(:show).by(one_user).with(id: 2) }
  #     it { is_expected.not_to access(:show).by(two_user).with(id: 1) }
  #   end
  # end

  # context '#new' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:new).by(one_user) }
  #     it { is_expected.to access(:new).by(two_user) }
  #     it { is_expected.to access(:new).by(admin_user) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:new).by(guest_user) }
  #   end
  # end

  # context '#edit' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:edit).by(one_user).with(id: 1) }
  #     it { is_expected.to access(:edit).by(two_user).with(id: 2) }
  #     it { is_expected.to access(:edit).by(admin_user).with(id: 1) }
  #     it { is_expected.to access(:edit).by(admin_user).with(id: 2) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:edit).by(guest_user).with(id: 1) }
  #     it { is_expected.not_to access(:edit).by(one_user).with(id: 2) }
  #     it { is_expected.not_to access(:edit).by(two_user).with(id: 1) }
  #   end
  # end

  # context '#create' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:create).by(one_user) }
  #     it { is_expected.to access(:create).by(two_user) }
  #     it { is_expected.to access(:create).by(admin_user) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:create).by(guest_user) }
  #   end
  # end

  # context '#update' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:update).by(one_user).with(id: 1) }
  #     it { is_expected.to access(:update).by(two_user).with(id: 2) }
  #     it { is_expected.to access(:update).by(admin_user).with(id: 1) }
  #     it { is_expected.to access(:update).by(admin_user).with(id: 2) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:update).by(guest_user).with(id: 1) }
  #     it { is_expected.not_to access(:update).by(one_user).with(id: 2) }
  #     it { is_expected.not_to access(:update).by(two_user).with(id: 1) }
  #   end
  # end

  # context '#destroy' do
  #   describe 'authorize' do
  #     it { is_expected.to access(:destroy).by(one_user).with(id: 1) }
  #     it { is_expected.to access(:destroy).by(two_user).with(id: 2) }
  #     it { is_expected.to access(:destroy).by(admin_user).with(id: 1) }
  #     it { is_expected.to access(:destroy).by(admin_user).with(id: 2) }
  #   end
  #
  #   describe 'not authorize' do
  #     it { is_expected.not_to access(:destroy).by(guest_user).with(id: 1) }
  #     it { is_expected.not_to access(:destroy).by(one_user).with(id: 2) }
  #     it { is_expected.not_to access(:destroy).by(two_user).with(id: 1) }
  #   end
  # end
end
```
