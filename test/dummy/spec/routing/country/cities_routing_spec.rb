require "rails_helper"

RSpec.describe Country::CitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/country/cities").to route_to("country/cities#index")
    end

    it "routes to #new" do
      expect(:get => "/country/cities/new").to route_to("country/cities#new")
    end

    it "routes to #show" do
      expect(:get => "/country/cities/1").to route_to("country/cities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/country/cities/1/edit").to route_to("country/cities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/country/cities").to route_to("country/cities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/country/cities/1").to route_to("country/cities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/country/cities/1").to route_to("country/cities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/country/cities/1").to route_to("country/cities#destroy", :id => "1")
    end

  end
end
