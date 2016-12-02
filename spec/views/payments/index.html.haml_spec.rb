require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :payment_type => "Payment Type",
        :amount => "Amount"
      ),
      Payment.create!(
        :payment_type => "Payment Type",
        :amount => "Amount"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => "Payment Type".to_s, :count => 2
    assert_select "tr>td", :text => "Amount".to_s, :count => 2
  end
end
