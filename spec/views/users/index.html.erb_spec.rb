require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    user = @user

    assign(:users, [ user ])

    @link_to_new = link_to 'New User', new_user_path
    @link_to_show = link_to 'Show', user
    @link_to_edit = link_to 'Edit', edit_user_path(user)
    @link_to_destroy = link_to 'Destroy', user, data: { confirm: 'Are you sure?' }, method: :delete
  end

  it "renders a list of users" do
    render

    assert_select "tr>td", :text => "User", :count => 1
    assert_select "tr>td", :text => "No", :count => 1
    assert_select "tr>td", :text => "user@email.com", :count => 1
  end

  it "when admin?" do
    sign_in @admin

    render

    expect(rendered).to match( @link_to_new )
    expect(rendered).to match( @link_to_show )
    expect(rendered).to match( @link_to_edit )
    expect(rendered.index( @link_to_destroy )).to be_truthy
  end

  it "when user" do
    sign_in @user

    render

    expect(rendered).not_to match( @link_to_new )
    expect(rendered).not_to match( @link_to_show )
    expect(rendered).not_to match( @link_to_edit )
    expect(rendered.index( @link_to_destroy )).to be_falsey
  end

  it "when other user" do
    sign_in @other

    render

    expect(rendered).not_to match( @link_to_new )
    expect(rendered).not_to match( @link_to_show )
    expect(rendered).not_to match( @link_to_edit )
    expect(rendered.index( @link_to_destroy )).to be_falsey
  end
end
