require 'rails_helper'

RSpec.describe "country/cities/edit", type: :view do
  before(:each) do
    @country_city = assign(:country_city, Country::City.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit country_city form" do
    render

    assert_select "form[action=?][method=?]", country_city_path(@country_city), "post" do

      assert_select "input#country_city_name[name=?]", "country_city[name]"
    end
  end
end
