require 'rails_helper'

RSpec.describe Devise::RegistrationsAuthorizer, type: :authorizer do

  # let(:guest_user) { nil }
  # let(:one_user) { double('Authenticated', admin_group?: false, user_group?: true, devise_registration_ids: [1]) }
  # let(:two_user) { double('Authenticated', admin_group?: false, user_group?: true, devise_registration_ids: [2]) }
  # let(:admin_user) { double('Authenticated', admin_group?: true, user_group?: false) }

  # context '#index' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :index)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :index)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :index)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :index)).to be_unauthorized }
  #   end
  # end

  # context '#show' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :show, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :show, id: 2)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :show, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :show, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :show, id: 1)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :show, id: 2)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :show, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#new' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :new)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :new)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :new)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :new)).to be_unauthorized }
  #   end
  # end

  # context '#edit' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :edit, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :edit, id: 2)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :edit, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :edit, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :edit, id: 1)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :edit, id: 2)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :edit, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#create' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :create)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :create)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :create)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :create)).to be_unauthorized }
  #   end
  # end

  # context '#update' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :update, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :update, id: 2)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :update, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :update, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :update, id: 1)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :update, id: 2)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :update, id: 1)).to be_unauthorized }
  #   end
  # end

  # context '#destroy' do
  #   describe 'authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :destroy, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :destroy, id: 2)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :destroy, id: 1)).to be_authorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(admin_user, :destroy, id: 2)).to be_authorized }
  #   end

  #   describe 'not authorize' do
  #     it { expect(Devise::RegistrationsAuthorizer.new(guest_user, :destroy, id: 1)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(one_user, :destroy, id: 2)).to be_unauthorized }

  #     it { expect(Devise::RegistrationsAuthorizer.new(two_user, :destroy, id: 1)).to be_unauthorized }
  #   end
  # end

end