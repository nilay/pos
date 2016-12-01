require 'rails_helper'

RSpec.describe "dishes/edit", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      :category => "MyString",
      :name => "MyString",
      :description => "MyString",
      :price => "MyString",
      :published => "MyString"
    ))
  end

  it "renders the edit dish form" do
    render

    assert_select "form[action=?][method=?]", dish_path(@dish), "post" do

      assert_select "input#dish_category[name=?]", "dish[category]"

      assert_select "input#dish_name[name=?]", "dish[name]"

      assert_select "input#dish_description[name=?]", "dish[description]"

      assert_select "input#dish_price[name=?]", "dish[price]"

      assert_select "input#dish_published[name=?]", "dish[published]"
    end
  end
end
