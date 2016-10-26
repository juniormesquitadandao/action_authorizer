require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, FactoryGirl.create(:product))

    @link_to_edit = link_to 'Edit', edit_product_path(@product)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Table/)
    expect(rendered).to match(/One/)
    expect(rendered).to match(/one@email.com/)
  end

  it "when admin?" do
    render
    expect(rendered).not_to match(@link_to_edit)
  end

  it "when product user" do
    allow(view).to receive(:authenticated).and_return(@product.user)
    render
    expect(rendered).to match(@link_to_edit)
  end

  it "when other user" do
    allow(view).to receive(:authenticated).and_return(FactoryGirl.build(:user))
    render
    expect(rendered).not_to match(@link_to_edit)
  end
end
