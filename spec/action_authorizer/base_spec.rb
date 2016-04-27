RSpec.describe 'Base' do

  let(:authenticated) { double('Authenticated') }

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
      it { expect(HousesAuthorizer.new(authenticated, 'index')).not_to be_authorized }
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:index){ true }
        expect(HousesAuthorizer.new(authenticated, 'index')).to be_authorized
      end
    end
  end

  context '#show' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(authenticated, 'show')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(authenticated, 'show', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ {id: []} }
        expect(HousesAuthorizer.new(authenticated, 'show', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ true }
        expect(HousesAuthorizer.new(authenticated, 'show')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ true }
        expect(HousesAuthorizer.new(authenticated, 'show', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ {id: [1]} }
        expect(HousesAuthorizer.new(authenticated, 'show', id: '1')).to be_authorized
      end
    end
  end

  context '#new' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(authenticated, 'new')).not_to be_authorized }
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:new){ true }
        expect(HousesAuthorizer.new(authenticated, 'new')).to be_authorized
      end
    end
  end

  context '#edit' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(authenticated, 'edit')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(authenticated, 'edit', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ {id: []} }
        expect(HousesAuthorizer.new(authenticated, 'edit', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ true }
        expect(HousesAuthorizer.new(authenticated, 'edit')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ true }
        expect(HousesAuthorizer.new(authenticated, 'edit', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:edit){ {id: [1]} }
        expect(HousesAuthorizer.new(authenticated, 'edit', id: '1')).to be_authorized
      end
    end
  end

  context '#create' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(authenticated, 'create')).not_to be_authorized }
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:create){ true }
        expect(HousesAuthorizer.new(authenticated, 'create')).to be_authorized
      end
    end
  end

  context '#update' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(authenticated, 'update')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(authenticated, 'update', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ {id: []} }
        expect(HousesAuthorizer.new(authenticated, 'update', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ true }
        expect(HousesAuthorizer.new(authenticated, 'update')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ true }
        expect(HousesAuthorizer.new(authenticated, 'update', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:update){ {id: [1]} }
        expect(HousesAuthorizer.new(authenticated, 'update', id: '1')).to be_authorized
      end
    end
  end

  context '#destroy' do
    describe 'not authorize' do
      it { expect(HousesAuthorizer.new(authenticated, 'destroy')).not_to be_authorized }

      it { expect(HousesAuthorizer.new(authenticated, 'destroy', id: '1')).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ {id: []} }
        expect(HousesAuthorizer.new(authenticated, 'destroy', id: '1')).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ true }
        expect(HousesAuthorizer.new(authenticated, 'destroy')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ true }
        expect(HousesAuthorizer.new(authenticated, 'destroy', id: '1')).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:destroy){ {id: [1]} }
        expect(HousesAuthorizer.new(authenticated, 'destroy', id: '1')).to be_authorized
      end
    end
  end

end