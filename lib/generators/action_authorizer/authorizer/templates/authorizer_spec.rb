require 'rails_helper'

RSpec.describe <%= controller_class_name %>Authorizer, type: :authorizer do
  # let(:guest_user) { nil }
  # let(:one_user) { double('User', admin_group?: false, user_group?: true, <%= singular_table_name %>_ids: [1]) }
  # let(:two_user) { double('User', admin_group?: false, user_group?: true, <%= singular_table_name %>_ids: [2]) }
  # let(:admin_user) { double('User', admin_group?: true, user_group?: false) }

<% unless options[:singleton] -%>
  # describe '#index' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:index) }
  #     it { expect(two_user).to be_authorized(:index) }
  #     it { expect(admin_user).to be_authorized(:index) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_authorized(:index) }
  #   end
  # end
<% end -%>

  # describe '#show' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:show, id: 1) }
  #     it { expect(two_user).to be_authorized(:show, id: 2) }
  #     it { expect(admin_user).to be_authorized(:show, id: 1) }
  #     it { expect(admin_user).to be_authorized(:show, id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_unauthorized(:show, id: 1) }
  #     it { expect(one_user).to be_unauthorized(:show, id: 2) }
  #     it { expect(two_user).to be_unauthorized(:show, id: 1) }
  #   end
  # end

  # describe '#new' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:new) }
  #     it { expect(two_user).to be_authorized(:new) }
  #     it { expect(admin_user).to be_authorized(:new) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_unauthorized(:new) }
  #   end
  # end

  # describe '#edit' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:edit, id: 1) }
  #     it { expect(two_user).to be_authorized(:edit, id: 2) }
  #     it { expect(admin_user).to be_authorized(:edit, id: 1) }
  #     it { expect(admin_user).to be_authorized(:edit, id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_unauthorized(:edit, id: 1) }
  #     it { expect(one_user).to be_unauthorized(:edit, id: 2) }
  #     it { expect(two_user).to be_unauthorized(:edit, id: 1) }
  #   end
  # end

  # describe '#create' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:create) }
  #     it { expect(two_user).to be_authorized(:create) }
  #     it { expect(admin_user).to be_authorized(:create) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_unauthorized(:create) }
  #   end
  # end

  # describe '#update' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:update, id: 1) }
  #     it { expect(two_user).to be_authorized(:update, id: 2) }
  #     it { expect(admin_user).to be_authorized(:update, id: 1) }
  #     it { expect(admin_user).to be_authorized(:update, id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_unauthorized(:update, id: 1) }
  #     it { expect(one_user).to be_unauthorized(:update, id: 2) }
  #     it { expect(two_user).to be_unauthorized(:update, id: 1) }
  #   end
  # end

  # describe '#destroy' do
  #   context 'when authorize' do
  #     it { expect(one_user).to be_authorized(:destroy, id: 1) }
  #     it { expect(two_user).to be_authorized(:destroy, id: 2) }
  #     it { expect(admin_user).to be_authorized(:destroy, id: 1) }
  #     it { expect(admin_user).to be_authorized(:destroy, id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect(guest_user).to be_unauthorized(:destroy, id: 1) }
  #     it { expect(one_user).to be_unauthorized(:destroy, id: 2) }
  #     it { expect(two_user).to be_unauthorized(:destroy, id: 1) }
  #   end
  # end
end