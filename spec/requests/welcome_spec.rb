require 'rails_helper'

RSpec.describe "Welcome", :type => :request do

  describe "GET /" do
    it "works! (now write some real specs)" do
      FactoryGirl.create(:user)

      get root_path
      expect(response).to have_http_status(:ok)

      post user_session_path, params: {user: {email: 'user@email.com', password: 'password'}}
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to root_path

      get root_path
      expect(response).to have_http_status(:moved_permanently)
      expect(response).to redirect_to products_path
    end
  end

end
