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
    expect(rendered).to match(/One/)
    expect(rendered).to match(/one@email.com/)
    expect(rendered).not_to match(@link_to_edit)
  end

  it "when product user" do
    sign_in @one

    render

    expect(rendered).to match(/Table/)
    expect(rendered).not_to match(/One/)
    expect(rendered).not_to match(/one@email.com/)
    expect(rendered).to match(@link_to_edit)
  end

  it "when other user" do
    sign_in @two

    render

    expect(rendered).to match(/Table/)
    expect(rendered).not_to match(/One/)
    expect(rendered).not_to match(/one@email.com/)
    expect(rendered).not_to match(@link_to_edit)
  end
end
