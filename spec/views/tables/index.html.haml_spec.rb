require 'rails_helper'

RSpec.describe "tables/index", type: :view do
  before(:each) do
    assign(:tables, [
      Table.create!(
        :name => "Name",
        :capacity => "Capacity",
        :description => "Description"
      ),
      Table.create!(
        :name => "Name",
        :capacity => "Capacity",
        :description => "Description"
      )
    ])
  end

  it "renders a list of tables" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Capacity".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
