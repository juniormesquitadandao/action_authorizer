require 'rails_helper'

RSpec.describe "welcome/index.json.jbuilder", :type => :view do

  it "renders a list of products" do
    product = FactoryGirl.create(:product)
    assign(:products, [ product ])

    render

    expect(rendered).to include_json([
      {
        id: product.id,
        name: "Table",
        url: product_url(product, format: :json)
      }
    ])
  end

end
