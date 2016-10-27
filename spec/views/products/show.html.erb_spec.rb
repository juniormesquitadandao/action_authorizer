require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, FactoryGirl.create(:product))

    @link_to_edit = link_to 'Edit', edit_product_path(@product)
  end

  it "when admin?" do
    sign_in @admin

    render

    expect(rendered).to match(/Table/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/user@email.com/)
    expect(rendered).not_to match(@link_to_edit)
  end

  it "when product user" do
    sign_in @user

    render

    expect(rendered).to match(/Table/)
    expect(rendered).not_to match(/User/)
    expect(rendered).not_to match(/user@email.com/)
    expect(rendered).to match(@link_to_edit)
  end

  it "when other user" do
    sign_in @other

    render

    expect(rendered).to match(/Table/)
    expect(rendered).not_to match(/User/)
    expect(rendered).not_to match(/user@email.com/)
    expect(rendered).not_to match(@link_to_edit)
  end
end
