require 'rails_helper'

RSpec.describe Category, type: :model do
  subject {
    described_class.new(name: "Anything", description: "some description")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "does not allow duplicate category name" do

    FactoryGirl.create(:category, name: 'test', description: 'test description')
    FactoryGirl.build(:category, name: 'test', description: 'new description').should_not be_valid
  end


end
