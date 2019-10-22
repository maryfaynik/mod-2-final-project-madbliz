# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TrinketOrder.destroy_all
Order.destroy_all
Trinket.destroy_all
Favorite.destroy_all
Blank.destroy_all
Madlib.destroy_all
User.destroy_all

puts "HI STARTING NOW"

u1 = User.create(first_name: "Mary", last_name: "Farner", user_name: "maryfarner", password: 'password' )
u2 = User.create(first_name: "Turcan", last_name: "Cicek", user_name: "turcancicek", password: 'password')


ml1 = Madlib.create(title: 'Test Madlib 1', body: "This is a super funny madlib")
ml2 = Madlib.create(title: 'Test Madlib 2', body: "This is a second super funny madlib")
ml3 = Madlib.create(title: 'Test Madlib 3', body: "This is an extra super funny madlib")

f1 = Favorite.create(madlib: ml1, user: u1)
f2 = Favorite.create(madlib: ml3, user: u1)
f3 = Favorite.create(madlib: ml2, user: u2)

t1 = Trinket.create(favorite: f1, product_type: "Mug", price: 10.00)
t2 = Trinket.create(favorite: f2, product_type: "T-Shirt", price: 20.00)
t3 = Trinket.create(favorite: f2, product_type: "Magnet", price: 20.00)

o1 = Order.create(placed: true, user: u1 )
o2 = Order.create(placed: true, user: u1 )

t_o1 = TrinketOrder.create(order: o1, trinket: t2 )
t_o2 = TrinketOrder.create(order: o1, trinket: t3 )
t_o3 = TrinketOrder.create(order: o2, trinket: t1 )

puts "HI I'M DONE"