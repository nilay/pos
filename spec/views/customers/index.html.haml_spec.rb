require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email_address => "Email Address",
        :phone_number => "Phone Number",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      ),
      Customer.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email_address => "Email Address",
        :phone_number => "Phone Number",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
  end
end
