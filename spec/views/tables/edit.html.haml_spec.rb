require 'rails_helper'

RSpec.describe "tables/edit", type: :view do
  before(:each) do
    @table = assign(:table, Table.create!(
      :name => "MyString",
      :capacity => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit table form" do
    render

    assert_select "form[action=?][method=?]", table_path(@table), "post" do

      assert_select "input#table_name[name=?]", "table[name]"

      assert_select "input#table_capacity[name=?]", "table[capacity]"

      assert_select "input#table_description[name=?]", "table[description]"
    end
  end
end