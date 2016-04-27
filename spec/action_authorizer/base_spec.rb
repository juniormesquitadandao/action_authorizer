RSpec.describe 'Base' do

  def request controller, action, others = {}
     params = {
      controller: controller.to_s,
      action: action.to_s,
     }
     params.merge! others

     request = double('request', params: params)

     request
  end

  context '#index' do

    describe 'not authorize' do
      it { expect(HousesAuthorizer.new('index', {})).not_to be_authorized }

      it { expect(HousesAuthorizer.new('index', {id: '1'})).not_to be_authorized }
    end

    describe 'authorize' do
      before(:each) do
        expect_any_instance_of(HousesAuthorizer).to receive(:index){ true }
      end

      it { expect(HousesAuthorizer.new('index', {})).to be_authorized }

      it { expect(HousesAuthorizer.new('index', {id: '1'})).to be_authorized }
    end

  end

  context '#show' do

    describe 'not authorize' do
      it { expect(HousesAuthorizer.new('show', {})).not_to be_authorized }

      it { expect(HousesAuthorizer.new('show', {id: '1'})).not_to be_authorized }

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ {id: []} }
        expect(HousesAuthorizer.new('show', {id: '1'})).not_to be_authorized
      end
    end

    describe 'authorize' do
      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ true }
        expect(HousesAuthorizer.new('show', {})).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ true }
        expect(HousesAuthorizer.new('show', {id: '1'})).to be_authorized
      end

      it do
        expect_any_instance_of(HousesAuthorizer).to receive(:show){ {id: [1]} }
        expect(HousesAuthorizer.new('show', {id: '1'})).to be_authorized
      end
    end

  end

end