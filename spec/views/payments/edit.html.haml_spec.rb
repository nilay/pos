require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :payment_type => "MyString",
      :amount => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input#payment_payment_type[name=?]", "payment[payment_type]"

      assert_select "input#payment_amount[name=?]", "payment[amount]"
    end
  end
end
