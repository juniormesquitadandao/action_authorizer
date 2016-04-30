require 'rails_helper'

<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_authorizer"

<% end -%>
<% module_namespacing do -%>
RSpec.describe <%= controller_class_name %>Authorizer, type: :authorizer do

  # let(:guest) { nil }
  # let(:user_one) { double('Authenticated', user?: true, <%= singular_table_name %>_ids: [1]) }
  # let(:user_two) { double('Authenticated', user?: true, <%= singular_table_name %>_ids: [2]) }
  # let(:admin) { double('Authenticated', admin?: true) }

<% unless options[:singleton] -%>
  # context '#index' do    describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'index')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'index')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'index')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'index')).to be_authorized }
  #   end
  # end
<% end -%>

  # context '#show' do
  #   describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'show', id: '1')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'show', id: '2')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'show', id: '1')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'show', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'show', id: '2')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'show', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'show', id: '2')).to be_authorized }
  #   end
  # end

  # context '#new' do
  #   describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'new')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'new')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'new')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'new')).to be_authorized }
  #   end
  # end

  # context '#edit' do
  #   describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'edit', id: '1')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'edit', id: '2')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'edit', id: '1')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'edit', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'edit', id: '2')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'edit', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'edit', id: '2')).to be_authorized }
  #   end
  # end

  # context '#create' do
  #   describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'create')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'create')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'create')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'create')).to be_authorized }
  #   end
  # end

  # context '#update' do
  #   describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'update', id: '1')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'update', id: '2')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'update', id: '1')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'update', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'update', id: '2')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'update', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'update', id: '2')).to be_authorized }
  #   end
  # end

  # context '#destroy' do
  #   describe 'not authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(guest, 'destroy', id: '1')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'destroy', id: '2')).not_to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'destroy', id: '1')).not_to be_authorized }
  #   end

  #   describe 'authorize' do
  #     it { expect(<%= controller_class_name %>Authorizer.new(user_one, 'destroy', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(user_two, 'destroy', id: '2')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'destroy', id: '1')).to be_authorized }

  #     it { expect(<%= controller_class_name %>Authorizer.new(admin, 'destroy', id: '2')).to be_authorized }
  #   end
  # end

end
<% end -%>