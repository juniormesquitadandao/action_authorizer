require "rails_helper"

RSpec.describe Devise::SessionsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/accounts/sign_in").to route_to("devise/sessions#new")
    end

    it "routes to #create" do
      expect(:post => "/accounts/sign_in").to route_to("devise/sessions#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/accounts/sign_out").to route_to("devise/sessions#destroy")
    end

  end
end
