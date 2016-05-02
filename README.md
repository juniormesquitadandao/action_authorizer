# Install

update file: Gemfile

```ruby
gem 'action_authorizer'
```

execute in console.

```console
bundle install
rails generate action_authorizer:install
```

generated file: app/authorizers/application_authorizer.rb

```ruby
class ApplicationAuthorizer < ActionAuthorizer::Base
end
```

updated file: app/controllers/application_controller.rb

```ruby
class ApplicationController < ActionController::Base
...
  before_action :authorize!, unless: :devise_controller?

  include ActionAuthorizer::Config

  # def authenticated
  #   current_user
  # end

  # def unauthorized_response_on_production
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end
end
```

updated file: spec/rails_helper.rb

```ruby
RSpec.configure do |config|
...
  config.before :each, type: :controller do
    allow(controller).to receive(:authorize!)
  end
end
```

updated file: app/helpers/application_helper.rb

```ruby
module ApplicationHelper
...
  include ActionAuthorizer::Helper

  # def authenticated
  #   current_user
  # end
end
```


```console
rails generate action_authorizer:authorizer gems
rails generate action_authorizer:authorizer dashboard/gems
```

# Action Authorizer

file: app/authorizers/gems_authorizer.rb

```ruby
class GemsAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # { id: authenticated.gem_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # { id: authenticated.gem_ids }
  end

  def create
    # true
  end

  def update
    # true
    # { id: authenticated.gem_ids }
  end

  def destroy
    # true
    # { id: authenticated.gem_ids }
  end

end
```

file: spec/authorizers/gems_authorizer_spec.rb

```ruby
require 'rails_helper'

RSpec.describe GemsAuthorizer, type: :authorizer do

  # let(:guest_user) { nil }
  # let(:one_user) { double('Authenticated', user_group?: true, gem_ids: [1]) }
  # let(:two_user) { double('Authenticated', user_group?: true, gem_ids: [2]) }
  # let(:admin_user) { double('Authenticated', admin_group?: true) }

  # context '#index' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'index')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'index')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'index')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'index')).not_to be_authorized }
  #   end
  # end

  # context '#show' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'show', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'show', id: '2')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'show', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'show', id: '2')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'show', id: '1')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(one_user, 'show', id: '2')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'show', id: '1')).not_to be_authorized }
  #   end
  # end

  # context '#new' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'new')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'new')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'new')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'new')).not_to be_authorized }
  #   end
  # end

  # context '#edit' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'edit', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'edit', id: '2')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'edit', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'edit', id: '2')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'edit', id: '1')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(one_user, 'edit', id: '2')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'edit', id: '1')).not_to be_authorized }
  #   end
  # end

  # context '#create' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'create')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'create')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'create')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'create')).not_to be_authorized }
  #   end
  # end

  # context '#update' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'update', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'update', id: '2')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'update', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'update', id: '2')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'update', id: '1')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(one_user, 'update', id: '2')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'update', id: '1')).not_to be_authorized }
  #   end
  # end

  # context '#destroy' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, 'destroy', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'destroy', id: '2')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'destroy', id: '1')).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, 'destroy', id: '2')).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, 'destroy', id: '1')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(one_user, 'destroy', id: '2')).not_to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, 'destroy', id: '1')).not_to be_authorized }
  #   end
  # end

end
```
