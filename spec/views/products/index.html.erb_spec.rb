require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      FactoryGirl.create(:product)
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Table", :count => 1
    assert_select "tr>td", :text => "One (one@email.com)", :count => 1
  end
end
