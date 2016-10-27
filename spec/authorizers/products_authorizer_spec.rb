require 'rails_helper'

RSpec.describe ProductsAuthorizer, type: :authorizer do

  let(:guest_user) { nil }
  let(:one_user) { double('Authenticated', admin?: false, product_ids: [1]) }
  let(:two_user) { double('Authenticated', admin?: false, product_ids: [2]) }
  let(:admin_user) { double('Authenticated', admin?: true, product_ids: []) }

  context '#index' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :index)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :index)).to be_authorized }

      it { expect(ProductsAuthorizer.new(admin_user, :index)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :index)).to be_unauthorized }
    end
  end

  context '#show' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :show)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :show)).to be_authorized }

      it { expect(ProductsAuthorizer.new(admin_user, :show)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :show)).to be_unauthorized }
    end
  end

  context '#new' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :new)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :new)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :new)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin_user, :new)).to be_unauthorized }
    end
  end

  context '#edit' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :edit, id: 1)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :edit, id: 2)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :edit)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(one_user, :edit, id: 2)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(two_user, :edit, id: 1)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin_user, :edit)).to be_unauthorized }
    end
  end

  context '#create' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :create)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :create)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :create)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin_user, :create)).to be_unauthorized }
    end
  end

  context '#update' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :update, id: 1)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :update, id: 2)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :update)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(one_user, :update, id: 2)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(two_user, :update, id: 1)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin_user, :update)).to be_unauthorized }
    end
  end

  context '#destroy' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(one_user, :destroy, id: 1)).to be_authorized }

      it { expect(ProductsAuthorizer.new(two_user, :destroy, id: 2)).to be_authorized }
   end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest_user, :destroy)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(one_user, :destroy, id: 2)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(two_user, :destroy, id: 1)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin_user, :destroy)).to be_unauthorized }
    end
  end

end