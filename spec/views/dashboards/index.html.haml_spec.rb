require 'rails_helper'

RSpec.describe "dashboards/index", type: :view do
  before(:each) do
    assign(:dashboards, [
      Home.create!(),
      Home.create!()
    ])
  end

  it "renders a list of dashboards" do
    render
  end
end
