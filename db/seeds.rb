# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.destroy_all
#Event.destroy_all
#Attendance.destroy_all
require 'faker'
#Populate User DB
20.times do
  u=User.new(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    description: Faker::Movies::Lebowski.quote,
    email: Faker::Internet.email,
    encrypted_password: rand(111111..222222)
  )
  u.save!
end
puts "User seed Ok"


