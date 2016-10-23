require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, FactoryGirl.create(:product))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Table/)
    expect(rendered).to match(/One/)
    expect(rendered).to match(/one@email.com/)
  end
end
