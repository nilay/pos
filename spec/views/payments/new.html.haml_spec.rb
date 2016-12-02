require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      :payment_type => "MyString",
      :amount => "MyString"
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input#payment_payment_type[name=?]", "payment[payment_type]"

      assert_select "input#payment_amount[name=?]", "payment[amount]"
    end
  end
end
