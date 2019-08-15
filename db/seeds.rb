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

4.times do
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


#Populate Event DB
User.all.each do |user|
  rand(1..3).times do
    Event.create(
      start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 365),
      duration: (rand(1..40) * 5).to_s,
      title: [Faker::Music.band + " concert event", Faker::Restaurant.name + " dinner event", Faker::Company.name + " business event"].sample,
      description: Faker::Quote.famous_last_words[20..1000],
      price: rand(1..1000).to_s,
      location: "Bordeaux",
     
    )
  end
end
puts "Event seed Ok"

#Populate Attendance DB
Event.all.each do |event|
  rand(1..5).times do
    event.attendees << User.where.not(id: event.attendee_ids).sample
  end
end
puts "Attendance seed Ok"

