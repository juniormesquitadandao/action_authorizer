# Install

update: Gemfile

```ruby
gem 'action_authorizer'
```

run

```console
bundle install
rails generate action_authorizer:install
```

generated: app/authorizers/application_authorizer.rb

```ruby
class ApplicationAuthorizer < ActionAuthorizer::Base
end
```

updated: app/controllers/application_controller.rb

```ruby
class ApplicationController < ActionController::Base
  # ...

  before_action :authorize!, unless: :devise_controller?

  include ActionAuthorizer::Config

  # def authenticated
  #   current_user
  # end

  # def respond_unauthorized_on_production_environment
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end
end
```

updated: app/helpers/application_helper.rb

```ruby
module ApplicationHelper
  # ...

  # Add helpers to check authorization authenticated.
  # def unauthorized? controller, action, params = {}
  # def authorized? controller, action, params = {}
  # ex.:
  #   authozired? :gems, :index
  #   authozired? 'gems', 'index'
  #   authozired? 'dashborad/gems', 'index'
  #   authozired? :gems, :show, id: 1
  #   authozired? :gems, :show, id: '1'
  include ActionAuthorizer::Helper

  # def authenticated
  #   current_user
  # end
end
```

updated: spec/rails_helper.rb

```ruby
RSpec.configure do |config|
  # ...

  # Skip before_action :authorize! to all controller spec
  config.before :each, type: :controller do
    allow(controller).to receive(:authorize!)
  end
end
```

run 

```console
rails generate scaffold gem name
rails generate action_authorizer:authorizer gems
```

generated: app/authorizers/gems_authorizer.rb

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

generated: spec/authorizers/gems_authorizer_spec.rb

```ruby
require 'rails_helper'

RSpec.describe GemsAuthorizer, type: :authorizer do

  # let(:guest_user) { nil }
  # let(:one_user) { double('Authenticated', user_group?: true, gem_ids: [1]) }
  # let(:two_user) { double('Authenticated', user_group?: true, gem_ids: [2]) }
  # let(:admin_user) { double('Authenticated', admin_group?: true) }

  # context '#index' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :index)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :index)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :index)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :index)).to be_unauthorized }
  #   end
  # end

  # context '#show' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :show, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :show, id: 2)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :show, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :show, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :show, id: 1)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(one_user, :show, id: 2)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(two_user, :show, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#new' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :new)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :new)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :new)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :new)).to be_unauthorized }
  #   end
  # end

  # context '#edit' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :edit, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :edit, id: 2)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :edit, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :edit, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :edit, id: 1)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(one_user, :edit, id: 2)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(two_user, :edit, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#create' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :create)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :create)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :create)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :create)).to be_unauthorized }
  #   end
  # end

  # context '#update' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :update, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :update, id: 2)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :update, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :update, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :update, id: 1)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(one_user, :update, id: 2)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(two_user, :update, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#destroy' do
  #   describe 'authorize' do
  #     it { expect(GemsAuthorizer.new(one_user, :destroy, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(two_user, :destroy, id: 2)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :destroy, id: 1)).to be_authorized }

  #     it { expect(GemsAuthorizer.new(admin_user, :destroy, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(GemsAuthorizer.new(guest_user, :destroy, id: 1)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(one_user, :destroy, id: 2)).to be_unauthorized }

  #     it { expect(GemsAuthorizer.new(two_user, :destroy, id: 1)).to be_unauthorized }
  #   end
  # end

end
```

run with module namespacing

```console
rails generate scaffold namespace/gem name
rails generate action_authorizer:authorizer namespace/gems
```

generated: app/authorizers/namespace/gems_authorizer.rb

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
class Namespace::GemsAuthorizer < ApplicationAuthorizer

  def index
    # true
  end

  def show
    # true
    # { id: authenticated.namespace_gem_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # { id: authenticated.namespace_gem_ids }
  end

  def create
    # true
  end

  def update
    # true
    # { id: authenticated.namespace_gem_ids }
  end

  def destroy
    # true
    # { id: authenticated.namespace_gem_ids }
  end

end
```

generated: spec/authorizers/namespace/gems_authorizer_spec.rb

```ruby
require 'rails_helper'

RSpec.describe Namespace::GemsAuthorizer, type: :authorizer do

  # let(:guest_user) { nil }
  # let(:one_user) { double('Authenticated', user_group?: true, namespace_gem_ids: [1]) }
  # let(:two_user) { double('Authenticated', user_group?: true, namespace_gem_ids: [2]) }
  # let(:admin_user) { double('Authenticated', admin_group?: true) }

  # context '#index' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :index)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :index)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :index)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :index)).to be_unauthorized }
  #   end
  # end

  # context '#show' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :show, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :show, id: 2)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :show, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :show, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :show, id: 1)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :show, id: 2)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :show, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#new' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :new)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :new)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :new)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :new)).to be_unauthorized }
  #   end
  # end

  # context '#edit' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :edit, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :edit, id: 2)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :edit, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :edit, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :edit, id: 1)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :edit, id: 2)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :edit, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#create' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :create)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :create)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :create)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :create)).to be_unauthorized }
  #   end
  # end

  # context '#update' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :update, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :update, id: 2)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :update, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :update, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :update, id: 1)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :update, id: 2)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :update, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#destroy' do
  #   describe 'authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :destroy, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :destroy, id: 2)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :destroy, id: 1)).to be_authorized }

  #     it { expect(Namespace::GemsAuthorizer.new(admin_user, :destroy, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Namespace::GemsAuthorizer.new(guest_user, :destroy, id: 1)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(one_user, :destroy, id: 2)).to be_unauthorized }

  #     it { expect(Namespace::GemsAuthorizer.new(two_user, :destroy, id: 1)).to be_unauthorized }
  #   end
  # end

end
```
