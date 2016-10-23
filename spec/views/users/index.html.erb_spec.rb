require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user)
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "One", :count => 1
    assert_select "tr>td", :text => "No", :count => 1
    assert_select "tr>td", :text => "one@email.com", :count => 1
  end
end
