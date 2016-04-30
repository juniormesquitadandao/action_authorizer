require 'rails_helper'

RSpec.describe "country/cities/new", type: :view do
  before(:each) do
    assign(:country_city, Country::City.new(
      :name => "MyString"
    ))
  end

  it "renders new country_city form" do
    render

    assert_select "form[action=?][method=?]", country_cities_path, "post" do

      assert_select "input#country_city_name[name=?]", "country_city[name]"
    end
  end
end
