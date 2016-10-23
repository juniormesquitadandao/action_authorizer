require "rails_helper"

RSpec.describe Devise::RegistrationsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      is_expected.to route(:get, "/accounts/sign_up").to("devise/registrations#new")
    end

    it "routes to #edit" do
      is_expected.to route(:get, "/accounts/edit").to("devise/registrations#edit")
    end

    it "routes to #create" do
      is_expected.to route(:post, "/accounts").to("devise/registrations#create")
    end
    it "routes to #update" do
      is_expected.to route(:put, "/accounts").to("devise/registrations#update")
    end

    it "routes to #destroy" do
      is_expected.to route(:delete, "/accounts").to("devise/registrations#destroy")
    end
    it "routes to #cancel" do
      is_expected.to route(:get, "/accounts/cancel").to("devise/registrations#cancel")
    end

  end
end
