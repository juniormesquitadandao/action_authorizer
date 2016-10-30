require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    product = FactoryGirl.create(:product)

    assign(:products, [ product ])

    @link_to_new = link_to 'New Product', new_product_path
    @link_to_show = link_to 'Show', product
    @link_to_edit = link_to 'Edit', edit_product_path(product)
    @link_to_destroy = link_to 'Destroy', product, data: { confirm: 'Are you sure?' }, method: :delete
  end

  it "when admin?" do
    sign_in @admin

    render

    assert_select "tr>td", :text => "Table", :count => 1
    assert_select "tr>td", :text => "User (user@email.com)", :count => 1
    expect(rendered).not_to match( @link_to_new )
    expect(rendered).to match( @link_to_show )
    expect(rendered).not_to match( @link_to_edit )
    expect(rendered.index( @link_to_destroy )).to be_falsey
  end

  it "when product user" do
    sign_in @user

    render

    assert_select "tr>td", :text => "Table", :count => 1
    assert_select "tr>td", :text => "User (user@email.com)", :count => 0
    expect(rendered).to match( @link_to_new )
    expect(rendered).to match( @link_to_show )
    expect(rendered).to match( @link_to_edit )
    expect(rendered.index( @link_to_destroy )).to be_truthy
  end

  it "when other user" do
    sign_in @other

    render

    assert_select "tr>td", :text => "Table", :count => 1
    assert_select "tr>td", :text => "User (user@email.com)", :count => 0
    expect(rendered).to match( @link_to_new )
    expect(rendered).to match( @link_to_show )
    expect(rendered).not_to match( @link_to_edit )
    expect(rendered.index( @link_to_destroy )).to be_falsey
  end
end
