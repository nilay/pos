require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :payment_type => "Payment Type",
      :amount => "Amount"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Payment Type/)
    expect(rendered).to match(/Amount/)
  end
end
