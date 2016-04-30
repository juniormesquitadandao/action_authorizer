require 'rails_helper'

RSpec.describe "Country::Cities", type: :request do
  describe "GET /country_cities" do
    it "works! (now write some real specs)" do
      get country_cities_path
      expect(response).to have_http_status(200)
    end
  end
end
