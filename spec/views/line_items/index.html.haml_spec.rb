require 'rails_helper'

RSpec.describe "line_items/index", type: :view do
  before(:each) do
    assign(:line_items, [
      LineItem.create!(
        :dist_id => "Dist"
      ),
      LineItem.create!(
        :dist_id => "Dist"
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => "Dist".to_s, :count => 2
  end
end
