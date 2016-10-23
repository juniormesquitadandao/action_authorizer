require "rails_helper"

RSpec.describe Devise::PasswordsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/accounts/password/new").to route_to("devise/passwords#new")
    end

    it "routes to #edit" do
      expect(:get => "/accounts/password/edit").to route_to("devise/passwords#edit")
    end

    it "routes to #create" do
      expect(:post => "/accounts/password").to route_to("devise/passwords#create")
    end

    it "routes to #update" do
      expect(:put => "/accounts/password").to route_to("devise/passwords#update")
    end

  end
end
