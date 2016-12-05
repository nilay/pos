require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject {
    described_class.new(name: "Anything", description: "some description", price: 4.0)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is by default" do
    category = FactoryGirl.create(:category, name: 'test', description: 'test description')
    dish = FactoryGirl.create(:dish, name: 'test', description: 'new description', price: 6.0, category_id: category.id)

    expect(dish.published).to eq(true)

  end

  it "does not allow duplicate name under same category" do

    category = FactoryGirl.create(:category, name: 'test', description: 'test description')
    FactoryGirl.create(:dish, name: 'test', description: 'new description', price: 6.0, category_id: category.id)
    FactoryGirl.build(:dish, name: 'test', description: 'new description', price: 6.0, category_id: category.id).should_not be_valid
  end

end
