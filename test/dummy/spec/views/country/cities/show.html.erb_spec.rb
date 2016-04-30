require 'rails_helper'

RSpec.describe "country/cities/show", type: :view do
  before(:each) do
    @country_city = assign(:country_city, Country::City.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
