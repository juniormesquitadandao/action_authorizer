require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @link_to_edit = link_to 'Edit', edit_user_path(@user)
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match(/User/)
    expect(rendered).to match(/No/)
    expect(rendered).to match(/user@email.com/)
  end

  it "when admin?" do
    sign_in @admin

    render

    expect(rendered).to match(@link_to_edit)
  end

  it "when user" do
    sign_in @user

    render

    expect(rendered).not_to match(@link_to_edit)
  end

  it "when other user" do
    sign_in @other

    render

    expect(rendered).not_to match(@link_to_edit)
  end
end
