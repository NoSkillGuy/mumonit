# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

current_time = Time.now

50.times do |i|
	User.create(name: (0...8).map { (65 + rand(26)).chr }.join, created_at: current_time)
	current_time = current_time - (1000*i)
end