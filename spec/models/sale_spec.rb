require 'rails_helper'

RSpec.describe Sale, type: :model do
  subject {
    waiter = FactoryGirl.create(:waiter)
    table = FactoryGirl.create(:table)
    customer = FactoryGirl.create(:customer)


    described_class.new(waiter_id: waiter.id, table_id: table.id, customer_id: customer.id)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "initial total amount be 0" do
    sale = FactoryGirl.create(:sale)
    expect(sale.total_amount).to eq(0.0)
  end

  it "total amount should be sum of items's price " do
    dish1 = FactoryGirl.create(:dish, name:'dish1', description:'dish1 description', price: 4.0 )
    dish2 = FactoryGirl.create(:dish, name:'dish2', description:'dish2 description', price: 3.0 )
    sale = FactoryGirl.create(:sale)
    sale.add_dish(dish1)
    expect(sale.total_amount).to eq(4.0)

    sale.add_dish(dish2)
    expect(sale.total_amount).to eq(7.0)
  end

  it "add existing item should increase the quantity" do
    dish1 = FactoryGirl.create(:dish, name:'dish1', description:'dish1 description', price: 4.0 )
    dish2 = FactoryGirl.create(:dish, name:'dish2', description:'dish2 description', price: 3.0 )
    sale = FactoryGirl.create(:sale)
    sale.add_dish(dish1)
    expect(sale.line_items.sum(:quantity)).to eq(1)
    expect(sale.line_items.count).to eq(1)

    sale.add_dish(dish2)
    expect(sale.line_items.sum(:quantity)).to eq(2)
    expect(sale.line_items.count).to eq(2)

    sale.add_dish(dish2)
    expect(sale.line_items.sum(:quantity)).to eq(3)
    expect(sale.line_items.count).to eq(2)

  end


end
