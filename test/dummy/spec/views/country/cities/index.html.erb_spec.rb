require 'rails_helper'

RSpec.describe "country/cities/index", type: :view do
  before(:each) do
    assign(:country_cities, [
      Country::City.create!(
        :name => "Name"
      ),
      Country::City.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of country/cities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
