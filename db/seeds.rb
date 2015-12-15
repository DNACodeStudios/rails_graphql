# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "dphaener@gmail.com", password: "foobar123")
user.todos.create(description: "Buy Milk", completed: true)
user.todos.create(description: "Buy Cheese", completed: false)
