require 'rails_helper'

RSpec.describe "products/index.json.jbuilder", :type => :view do

  before(:each) do
    @product = FactoryGirl.create(:product)

    assign(:products, [ @product ])
  end

  it "when admin?" do
    sign_in @admin

    render

    expect(rendered).to include_json([
      {
        id: @product.id,
        name: "Table",
        user_id: @product.user_id,
        url: product_url(@product, format: :json)
      }
    ])
  end

  it "when product user" do
    sign_in @user

    render

    expect(rendered).to include_json([
      {
        id: @product.id,
        name: "Table",
        url: product_url(@product, format: :json)
      }
    ])
  end

  it "when other user" do
    sign_in @other

    render

    expect(rendered).to include_json([
      {
        id: @product.id,
        name: "Table",
        url: product_url(@product, format: :json)
      }
    ])
  end

end
