require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/One/)
    expect(rendered).to match(/No/)
    expect(rendered).to match(/one@email.com/)
  end
end
