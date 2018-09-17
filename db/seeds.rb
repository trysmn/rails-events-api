# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding database with 10 events..."

time_now = Time.now.iso8601(3)

10.times do
  Event.create(start_time: time_now, end_time: time_now + 14, label: Faker::Ancient.god, category: Faker::Color.color_name )
end

puts "All done!"
