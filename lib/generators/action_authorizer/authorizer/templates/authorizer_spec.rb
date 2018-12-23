require 'rails_helper'

RSpec.describe <%= controller_class_name %>Authorizer, type: :authorizer do
  # let(:guest_user) { nil }
  # let(:one_user) { double('User', admin_group?: false, user_group?: true, <%= singular_table_name %>_ids: [1]) }
  # let(:two_user) { double('User', admin_group?: false, user_group?: true, <%= singular_table_name %>_ids: [2]) }
  # let(:admin_user) { double('User', admin_group?: true, user_group?: false) }

<% unless options[:singleton] -%>
  # describe '#index' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:index) }
  #     it { expect.to authorize(two_user).access(:index) }
  #     it { expect.to authorize(admin_user).access(:index) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:index) }
  #   end
  # end
<% end -%>

  # describe '#show' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:show).with(id: 1) }
  #     it { expect.to authorize(two_user).access(:show).with(id: 2) }
  #     it { expect.to authorize(admin_user).access(:show).with(id: 1) }
  #     it { expect.to authorize(admin_user).access(:show).with(id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:show).with(id: 1) }
  #     it { expect.not_to authorize(one_user).access(:show).with(id: 2) }
  #     it { expect.not_to authorize(two_user).access(:show).with(id: 1) }
  #   end
  # end

  # describe '#new' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:new) }
  #     it { expect.to authorize(two_user).access(:new) }
  #     it { expect.to authorize(admin_user).access(:new) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:new) }
  #   end
  # end

  # describe '#edit' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:edit).with(id: 1) }
  #     it { expect.to authorize(two_user).access(:edit).with(id: 2) }
  #     it { expect.to authorize(admin_user).access(:edit).with(id: 1) }
  #     it { expect.to authorize(admin_user).access(:edit).with(id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:edit).with(id: 1) }
  #     it { expect.not_to authorize(one_user).access(:edit).with(id: 2) }
  #     it { expect.not_to authorize(two_user).access(:edit).with(id: 1) }
  #   end
  # end

  # describe '#create' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:create) }
  #     it { expect.to authorize(two_user).access(:create) }
  #     it { expect.to authorize(admin_user).access(:create) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:create) }
  #   end
  # end

  # describe '#update' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:update).with(id: 1) }
  #     it { expect.to authorize(two_user).access(:update).with(id: 2) }
  #     it { expect.to authorize(admin_user).access(:update).with(id: 1) }
  #     it { expect.to authorize(admin_user).access(:update).with(id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:update).with(id: 1) }
  #     it { expect.not_to authorize(one_user).access(:update).with(id: 2) }
  #     it { expect.not_to authorize(two_user).access(:update).with(id: 1) }
  #   end
  # end

  # describe '#destroy' do
  #   context 'when authorize' do
  #     it { expect.to authorize(one_user).access(:destroy).with(id: 1) }
  #     it { expect.to authorize(two_user).access(:destroy).with(id: 2) }
  #     it { expect.to authorize(admin_user).access(:destroy).with(id: 1) }
  #     it { expect.to authorize(admin_user).access(:destroy).with(id: 2) }
  #   end

  #   context 'when not authorize' do
  #     it { expect.not_to authorize(guest_user).access(:destroy).with(id: 1) }
  #     it { expect.not_to authorize(one_user).access(:destroy).with(id: 2) }
  #     it { expect.not_to authorize(two_user).access(:destroy).with(id: 1) }
  #   end
  # end
end