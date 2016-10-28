require "rails_helper"

RSpec.describe ProductsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      is_expected.to route(:get, "/products").to("products#index")
    end

    it "routes to #new" do
      is_expected.to route(:get, "/products/new").to("products#new")
    end

    it "routes to #show" do
      is_expected.to route(:get, "/products/1").to("products#show", id: 1)
    end

    it "routes to #edit" do
      is_expected.to route(:get, "/products/1/edit").to("products#edit", id: 1)
    end

    it "routes to #create" do
      is_expected.to route(:post, "/products").to("products#create")
    end

    it "routes to #update via PUT" do
      is_expected.to route(:put, "/products/1").to("products#update", id: 1)
    end

    it "routes to #destroy" do
      is_expected.to route(:delete, "/products/1").to("products#destroy", id: 1)
    end

  end
end
