require 'rails_helper'

RSpec.describe "users/index.json.jbuilder", :type => :view do

  before(:each) do
    assign(:users, [ @user ])
  end

  it "renders a list of users" do
    sign_in @admin

    render

    expect(rendered).to include_json([
      {
        id: @user.id,
        name: "User",
        email: "user@email.com",
        admin: false,
        url: user_url(@user, format: :json)
      }
    ])
  end

end
