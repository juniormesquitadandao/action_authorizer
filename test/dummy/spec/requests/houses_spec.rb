require 'rails_helper'

RSpec.describe "Houses", type: :request do
  describe "GET /houses" do
    it "works! (now write some real specs)" do
      get houses_path
      expect(response).to have_http_status(200)
    end
  end
end
