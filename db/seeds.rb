# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do 
	User.create(
		name: Faker::Name.name,
		password:  SecureRandom.hex,
		email: Faker::Internet.email
		)
end

10.times do 
	Client.create(
		fullname: Faker::Name.name,
		street: Faker::Address.street_address,
		apt: Faker::Address.secondary_address,
		borough: "Brooklyn",
		notes: Faker::Lorem.sentence(1),
		user_id: rand(1..10)
		)
end


10.times do 
	Job.create(
		name: Faker::Lorem.word,
		jobdate: Faker::Time.forward(90, :morning),
		payrate: rand(1..50),
		paid: [true, false].sample,
		equipment: Faker::Lorem.sentence(1),
		user_id: rand(1..10),
		client_id: rand(1..10)
		)
end



Category.create(
	title: "babysitting"
	)

Category.create(
	title: "catering"
	)

Category.create(
	title: "photographer"
	)

Category.create(
	title: "web design"
	)

Category.create(
	title: "research"
	)

Category.create(
	title: "administrative"
	)

Category.create(
	title: "tutoring"
	)

Category.create(
	title: "accounting"
	)

Category.create(
	title: "dog walking"
	)

Category.create(
	title: "copywriting"
	)

10.times do 
	JobCategory.create(
		job_id: rand(1..10),
		category_id: rand(1..10)	
		)
end