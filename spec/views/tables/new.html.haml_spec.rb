require 'rails_helper'

RSpec.describe "tables/new", type: :view do
  before(:each) do
    assign(:table, Table.new(
      :name => "MyString",
      :capacity => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new table form" do
    render

    assert_select "form[action=?][method=?]", tables_path, "post" do

      assert_select "input#table_name[name=?]", "table[name]"

      assert_select "input#table_capacity[name=?]", "table[capacity]"

      assert_select "input#table_description[name=?]", "table[description]"
    end
  end
end
