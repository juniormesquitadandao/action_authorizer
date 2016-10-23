require "rails_helper"

RSpec.describe Devise::PasswordsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      is_expected.to route(:get, "/accounts/password/new").to("devise/passwords#new")
    end

    it "routes to #edit" do
      is_expected.to route(:get, "/accounts/password/edit").to("devise/passwords#edit")
    end

    it "routes to #create" do
      is_expected.to route(:post, "/accounts/password").to("devise/passwords#create")
    end
    it "routes to #update" do
      is_expected.to route(:put, "/accounts/password").to("devise/passwords#update")
    end

  end
end
