require 'rails_helper'

RSpec.describe ProductsAuthorizer, type: :authorizer do

  let(:guest) { nil }
  let(:user) { double('Authenticated', admin?: false, product_ids: [1]) }
  let(:other) { double('Authenticated', admin?: false, product_ids: [2]) }
  let(:admin) { double('Authenticated', admin?: true, product_ids: []) }

  context '#index' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :index)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :index)).to be_authorized }

      it { expect(ProductsAuthorizer.new(admin, :index)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :index)).to be_unauthorized }
    end
  end

  context '#show' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :show)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :show)).to be_authorized }

      it { expect(ProductsAuthorizer.new(admin, :show)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :show)).to be_unauthorized }
    end
  end

  context '#new' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :new)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :new)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :new)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin, :new)).to be_unauthorized }
    end
  end

  context '#edit' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :edit, id: 1)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :edit, id: 2)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :edit)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(user, :edit, id: 2)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(other, :edit, id: 1)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin, :edit)).to be_unauthorized }
    end
  end

  context '#create' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :create)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :create)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :create)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin, :create)).to be_unauthorized }
    end
  end

  context '#update' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :update, id: 1)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :update, id: 2)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :update)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(user, :update, id: 2)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(other, :update, id: 1)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin, :update)).to be_unauthorized }
    end
  end

  context '#destroy' do
    describe 'authorize' do
      it { expect(ProductsAuthorizer.new(user, :destroy, id: 1)).to be_authorized }

      it { expect(ProductsAuthorizer.new(other, :destroy, id: 2)).to be_authorized }
   end

    describe 'not authorize' do
      it { expect(ProductsAuthorizer.new(guest, :destroy)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(user, :destroy, id: 2)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(other, :destroy, id: 1)).to be_unauthorized }

      it { expect(ProductsAuthorizer.new(admin, :destroy)).to be_unauthorized }
    end
  end

end