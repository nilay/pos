require 'rails_helper'

RSpec.describe "dishes/show", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      :category => "Category",
      :name => "Name",
      :description => "Description",
      :price => "Price",
      :published => "Published"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Published/)
  end
end
