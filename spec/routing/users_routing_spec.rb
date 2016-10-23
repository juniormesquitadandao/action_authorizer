require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      is_expected.to route(:get, "/users").to("users#index")
    end

    it "routes to #new" do
      is_expected.to route(:get, "/users/new").to("users#new")
    end

    it "routes to #show" do
      is_expected.to route(:get, "/users/1").to("users#show", id: 1)
    end

    it "routes to #edit" do
      is_expected.to route(:get, "/users/1/edit").to("users#edit", id: 1)
    end

    it "routes to #create" do
      is_expected.to route(:post, "/users").to("users#create")
    end

    it "routes to #update via PUT" do
      is_expected.to route(:put, "/users/1").to("users#update", id: 1)
    end

    it "routes to #destroy" do
      is_expected.to route(:delete, "/users/1").to("users#destroy", id: 1)
    end

  end
end
