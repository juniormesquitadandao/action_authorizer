require "rails_helper"

RSpec.describe Devise::RegistrationsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/accounts/sign_up").to route_to("devise/registrations#new")
    end

    it "routes to #edit" do
      expect(:get => "/accounts/edit").to route_to("devise/registrations#edit")
    end

    it "routes to #create" do
      expect(:post => "/accounts").to route_to("devise/registrations#create")
    end

    it "routes to #update" do
      expect(:put => "/accounts").to route_to("devise/registrations#update")
    end

    it "routes to #destroy" do
      expect(:delete => "/accounts").to route_to("devise/registrations#destroy")
    end

    it "routes to #cancel" do
      expect(:get => "/accounts/cancel").to route_to("devise/registrations#cancel")
    end

  end
end
