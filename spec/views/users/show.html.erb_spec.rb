require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))

    @link_to_edit = link_to 'Edit', edit_user_path(@user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/One/)
    expect(rendered).to match(/No/)
    expect(rendered).to match(/one@email.com/)
  end

  it "when admin?" do
    render
    expect(rendered).to match(@link_to_edit)
  end

  it "when other user" do
    allow(view).to receive(:authenticated).and_return(@user)
    render
    expect(rendered).not_to match(@link_to_edit)
  end
end
