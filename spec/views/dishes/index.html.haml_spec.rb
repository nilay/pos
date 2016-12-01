require 'rails_helper'

RSpec.describe "dishes/index", type: :view do
  before(:each) do
    assign(:dishes, [
      Dish.create!(
        :category => "Category",
        :name => "Name",
        :description => "Description",
        :price => "Price",
        :published => "Published"
      ),
      Dish.create!(
        :category => "Category",
        :name => "Name",
        :description => "Description",
        :price => "Price",
        :published => "Published"
      )
    ])
  end

  it "renders a list of dishes" do
    render
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Published".to_s, :count => 2
  end
end
