require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe HousesController, type: :controller do

  before(:each) do
    Group.create! name: 'user'
    User.create! email: 'one@email', password: 'password', group: Group.first
    allow(controller).to receive(:current_user) { User.first }
  end

  # This should return the minimal set of attributes required to create a valid
  # House. As you add validations to House, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {street: 'name'}
  }

  let(:invalid_attributes) {
    {street: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HousesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all houses as @houses" do
      house = House.create! valid_attributes.merge(user: User.first)

      user = User.create! email: 'two@email', password: 'password'
      House.create! street: 'ohter', user: user

      get :index, {}, valid_session

      expect(assigns(:houses)).to eq([house])
    end
  end

  describe "GET #show" do
    it "assigns the requested house as @house" do
      house = House.create! valid_attributes
      get :show, {:id => house.to_param}, valid_session
      expect(assigns(:house)).to eq(house)
    end
  end

  describe "GET #new" do
    it "assigns a new house as @house" do
      get :new, {}, valid_session
      expect(assigns(:house)).to be_a_new(House)
    end
  end

  describe "GET #edit" do
    it "assigns the requested house as @house" do
      house = House.create! valid_attributes
      get :edit, {:id => house.to_param}, valid_session
      expect(assigns(:house)).to eq(house)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new House" do
        expect {
          post :create, {:house => valid_attributes}, valid_session
        }.to change(House, :count).by(1)
      end

      it "assigns a newly created house as @house" do
        post :create, {:house => valid_attributes}, valid_session
        expect(assigns(:house)).to be_a(House)
        expect(assigns(:house)).to be_persisted
      end

      it "redirects to the created house" do
        post :create, {:house => valid_attributes}, valid_session
        expect(response).to redirect_to(House.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved house as @house" do
        post :create, {:house => invalid_attributes}, valid_session
        expect(assigns(:house)).to be_a_new(House)
      end

      it "re-renders the 'new' template" do
        post :create, {:house => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {street: 'other'}
      }

      it "updates the requested house" do
        house = House.create! valid_attributes
        put :update, {:id => house.to_param, :house => new_attributes}, valid_session
        house.reload
        expect(house.street).to eq 'other'
      end

      it "assigns the requested house as @house" do
        house = House.create! valid_attributes
        put :update, {:id => house.to_param, :house => valid_attributes}, valid_session
        expect(assigns(:house)).to eq(house)
      end

      it "redirects to the house" do
        house = House.create! valid_attributes
        put :update, {:id => house.to_param, :house => valid_attributes}, valid_session
        expect(response).to redirect_to(house)
      end
    end

    context "with invalid params" do
      it "assigns the house as @house" do
        house = House.create! valid_attributes
        put :update, {:id => house.to_param, :house => invalid_attributes}, valid_session
        expect(assigns(:house)).to eq(house)
      end

      it "re-renders the 'edit' template" do
        house = House.create! valid_attributes
        put :update, {:id => house.to_param, :house => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested house" do
      house = House.create! valid_attributes
      expect {
        delete :destroy, {:id => house.to_param}, valid_session
      }.to change(House, :count).by(-1)
    end

    it "redirects to the houses list" do
      house = House.create! valid_attributes
      delete :destroy, {:id => house.to_param}, valid_session
      expect(response).to redirect_to(houses_url)
    end
  end

end