# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'nilay@test.com', password: 'root1234')

category = Category.create(name: 'Food', description: 'Something to eat')

Dish.create(name: 'Tater tots', description:'', price: 2.35, category_id: category.id)
Dish.create(name: 'San Francisco sourdough bread', description:'', price: 8.00, category_id: category.id)
Dish.create(name: 'Cobb salad', description:'', price: 3.50, category_id: category.id)
Dish.create(name: 'Pot roast', description:'', price: 4.30, category_id: category.id)
Dish.create(name: 'Twinkies', description:'', price: 6.30, category_id: category.id)

category = Category.create(name: 'Drinks', description: 'Something to eat')

Dish.create(name: 'Coke', description:'', price: 2.35, category_id: category.id)
Dish.create(name: 'Pepsi', description:'', price: 8.00, category_id: category.id)
Dish.create(name: 'Minute Made', description:'', price: 3.50, category_id: category.id)
Dish.create(name: 'Diet Coke', description:'', price: 4.30, category_id: category.id)
Dish.create(name: 'Diet Pepsi', description:'', price: 6.30, category_id: category.id)


customer1 = Customer.create(email_address:'nilayanand@gmail.com', first_name: 'Nilay', last_name: 'Anand', phone_number: '9876727393', address: '954, Sec - 4', city: 'Panchkula', state: 'HR', zip: '134112')
customer2 = Customer.create(email_address:'rocy@test.com', first_name: 'Rocky', last_name: 'Wright', phone_number: '9898989898', address: '101, Lane - 4', city: 'CA', state: 'CA', zip: '95101')
customer3 = Customer.create(email_address:'sophia@test.com', first_name: 'Sophia', last_name: 'Popova', phone_number: '87878788', address: 'jo-street', city: 'NY', state: 'NY', zip: '95402')


table1 = Table.create(name: 'Table1', capacity: 4, description:'')
table2 = Table.create(name: 'Table2', capacity: 4, description:'')


waiter1 = Waiter.create(first_name:'Jen', last_name: 'Thompson')
waiter2 = Waiter.create(first_name:'Ana', last_name: 'kowal')
