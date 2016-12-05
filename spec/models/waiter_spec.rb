require 'rails_helper'

RSpec.describe Waiter, type: :model do
  subject {
    described_class.new(first_name: "Anything", last_name: "some description")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end


end
