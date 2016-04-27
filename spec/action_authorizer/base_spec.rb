RSpec.describe 'Base' do

  let(:autenticated) { double('Autenticated') }

  def request controller, action, others = {}
     params = {
      controller: controller.to_s,
      action: action.to_s,
     }
     params.merge! others

     request = double('Request', params: params)
     request
  end

  context '#index' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'index')).not_to be_authorized }
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:index){ true }
        expect(HousesAuthorizer.new(autenticated, 'index')).to be_authorized
      end
    end
  end

  context '#show' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'show')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(autenticated, 'show', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ {id: []} }
        expect(HousesAuthorizer.new(autenticated, 'show', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ true }
        expect(HousesAuthorizer.new(autenticated, 'show')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ true }
        expect(HousesAuthorizer.new(autenticated, 'show', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ {id: [1]} }
        expect(HousesAuthorizer.new(autenticated, 'show', id: '1')).to be_authorized
      end
    end
  end

  context '#new' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'new')).not_to be_authorized }
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:new){ true }
        expect(HousesAuthorizer.new(autenticated, 'new')).to be_authorized
      end
    end
  end

  context '#edit' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'edit')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(autenticated, 'edit', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ {id: []} }
        expect(HousesAuthorizer.new(autenticated, 'edit', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ true }
        expect(HousesAuthorizer.new(autenticated, 'edit')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ true }
        expect(HousesAuthorizer.new(autenticated, 'edit', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ {id: [1]} }
        expect(HousesAuthorizer.new(autenticated, 'edit', id: '1')).to be_authorized
      end
    end
  end

  context '#create' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'create')).not_to be_authorized }
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:create){ true }
        expect(HousesAuthorizer.new(autenticated, 'create')).to be_authorized
      end
    end
  end

  context '#update' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'update')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(autenticated, 'update', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ {id: []} }
        expect(HousesAuthorizer.new(autenticated, 'update', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ true }
        expect(HousesAuthorizer.new(autenticated, 'update')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ true }
        expect(HousesAuthorizer.new(autenticated, 'update', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ {id: [1]} }
        expect(HousesAuthorizer.new(autenticated, 'update', id: '1')).to be_authorized
      end
    end
  end

  context '#destroy' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(autenticated, 'destroy')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(autenticated, 'destroy', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ {id: []} }
        expect(HousesAuthorizer.new(autenticated, 'destroy', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ true }
        expect(HousesAuthorizer.new(autenticated, 'destroy')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ true }
        expect(HousesAuthorizer.new(autenticated, 'destroy', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ {id: [1]} }
        expect(HousesAuthorizer.new(autenticated, 'destroy', id: '1')).to be_authorized
      end
    end
  end

end