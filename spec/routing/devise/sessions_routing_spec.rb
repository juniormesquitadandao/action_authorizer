require "rails_helper"

RSpec.describe Devise::SessionsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      is_expected.to route(:get, "/accounts/sign_in").to("devise/sessions#new")
    end

    it "routes to #create" do
      is_expected.to route(:post, "/accounts/sign_in").to("devise/sessions#create")
    end

    it "routes to #destroy" do
      is_expected.to route(:delete, "/accounts/sign_out").to("devise/sessions#destroy")
    end

  end
end
