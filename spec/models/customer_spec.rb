require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject {
    described_class.new(
        first_name: "Anything",
        last_name: "dabbu",
        email_address: "test@anywhere.com",
        address: "101/4A",
        city: "PKL",
        state: "HR",
        zip: "134112",
        phone_number: "9898998"

    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email_address = nil
    expect(subject).to_not be_valid
  end


end
