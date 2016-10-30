require 'rails_helper'

RSpec.describe "users/show.json.jbuilder", :type => :view do

  it "renders a user" do
    render

    expect(rendered).to include_json(
      {
        id: @user.id,
        name: "User",
        email: "user@email.com",
        admin: false,
        url: user_url(@user, format: :json)
      }
    )
  end

end
