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



puts "HI I'M DONE"