# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new
user.email = "nilay#{rand(1000)}@test.com"
user.password = 'root1234'
user.save


category = Category.create(name: "Food#{rand(1000)}", description: "Something to eat #{rand(1000)}")


dish11 = Dish.create(name: "Tater tots#{rand(1000)}", description:"#{rand(1000)}", price: 2.35, category_id: category.id)
dish12 = Dish.create(name: "San Francisco sourdough bread#{rand(1000)}", description:"", price: 8.00, category_id: category.id)
dish13 = Dish.create(name: "Cobb salad#{rand(1000)}", description:"#{rand(1000)}", price: 3.50, category_id: category.id)
dish14 = Dish.create(name: "Pot roast#{rand(1000)}", description:"#{rand(1000)}", price: 4.30, category_id: category.id)
dish15 = Dish.create(name: "Twinkies#{rand(1000)}", description:"#{rand(1000)}", price: 6.30, category_id: category.id)

category = Category.create(name: "Drinks #{rand(1000)}", description: "Something to eat #{rand(1000)}")

dish21 = Dish.create(name: "Coke#{rand(1000)}", description:"#{rand(1000)}", price: 2.35, category_id: category.id)
dish22 = Dish.create(name: "Pepsi#{rand(1000)}", description:"#{rand(1000)}", price: 8.00, category_id: category.id)
dish23 = Dish.create(name: "Minute Made#{rand(1000)}", description:"#{rand(1000)}", price: 3.50, category_id: category.id)
dish24 = Dish.create(name: "Diet Coke#{rand(1000)}", description:"#{rand(1000)}", price: 4.30, category_id: category.id)
dish25 = Dish.create(name: "Diet Pepsi#{rand(1000)}", description:"#{rand(1000)}", price: 6.30, category_id: category.id)


customer1 = Customer.create(email_address:"nilayanand@gmail#{rand(1000)}.com", first_name: "Nilay#{rand(1000)}", last_name: "Anand", phone_number: "9876727393", address: "954, Sec - 4", city: "Panchkula", state: "HR", zip: "134112")
customer2 = Customer.create(email_address:"rocy@test#{rand(1000)}.com", first_name: "Rocky#{rand(1000)}", last_name: "Wright", phone_number: "9898989898", address: "101, Lane - 4", city: "CA", state: "CA", zip: "95101")
customer3 = Customer.create(email_address:"sophia@test#{rand(1000)}.com", first_name: "Sophia#{rand(1000)}", last_name: "Popova", phone_number: "87878788", address: "jo-street", city: "NY", state: "NY", zip: "95402")


table1 = Table.create(name: "Table1#{rand(1000)}", capacity: 4, description:"Wooden table with four chairs")
table2 = Table.create(name: "Table2#{rand(1000)}", capacity: 4, description:"At corner side")


waiter1 = Waiter.create(first_name:"Jen#{rand(1000)}", last_name: "Thompson")
waiter2 = Waiter.create(first_name:"Ana#{rand(1000)}", last_name: "kowal")


order1 = Sale.create(customer_id: customer1.id, table_id: table1.id, waiter_id: waiter1.id)
order1.add_dish(dish11)
order1.add_dish(dish12)
order1.add_dish(dish13)
order1.add_dish(dish21)
order1.add_dish(dish22)
order1.payments.create(amount: 24.5, payment_type: "Cash")

order2 = Sale.create(customer_id: customer2.id, table_id: table2.id, waiter_id: waiter2.id)
order2.add_dish(dish23)
order2.add_dish(dish24)
order2.add_dish(dish24)
order2.add_dish(dish25)
order2.add_dish(dish14)
order2.payments.create(amount: 29.5, payment_type: "Cash")

order3 = Sale.create(customer_id: customer3.id, table_id: table2.id, waiter_id: waiter2.id)
order3.add_dish(dish23)
order3.add_dish(dish11)
order3.add_dish(dish22)
order3.add_dish(dish25)
order3.add_dish(dish14)
order1.payments.create(amount: 22.5, payment_type: "Card")