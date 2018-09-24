# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding database with 2 categories..."

2.times do
  Category.create(label: Faker::Color.color_name)
end

puts "All done!"

puts "Seeding database with 10 events..."

# we create our base time to work with:
time_now = DateTime.new(2018, 9, 17, 9, 0, 0, "+01:00")

# we then create 10 events with the same start and end times,but each event is on the next day after the last one:
10.times do
  Event.create(start_time: time_now.iso8601(0), end_time: (time_now + (60 * 60 * 7)).iso8601(0), label: Faker::Ancient.god, category_id: 1)
  time_now += 60 * 60 * 24
end

puts "All done!"


