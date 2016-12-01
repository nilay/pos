require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email_address => "MyString",
      :phone_number => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input#customer_first_name[name=?]", "customer[first_name]"

      assert_select "input#customer_last_name[name=?]", "customer[last_name]"

      assert_select "input#customer_email_address[name=?]", "customer[email_address]"

      assert_select "input#customer_phone_number[name=?]", "customer[phone_number]"

      assert_select "input#customer_address[name=?]", "customer[address]"

      assert_select "input#customer_city[name=?]", "customer[city]"

      assert_select "input#customer_state[name=?]", "customer[state]"

      assert_select "input#customer_zip[name=?]", "customer[zip]"
    end
  end
end
