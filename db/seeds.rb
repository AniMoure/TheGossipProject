# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do 
	user = User.create(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		description: Faker::Movie.quote,
		email: Faker::Internet.email,
		age: Faker::Number.number(2)
	)
	city = City.create(
		name: Faker::WorldCup.city,
		postal_code: Faker::Number.number(5),
		user_id: rand((User.first.id)..(User.last.id))
	)
	tag = Tag.create(
		title: Faker::HarryPotter.spell
	)
	gossip = Gossip.create(
		title: Faker::Music.album,
		content: Faker::HeyArnold.quote,
		user_id: rand((User.first.id)..(User.last.id))
	)
	tag.gossips << gossip
end

20.times do 
	gossip = Gossip.create(
		title: Faker::Music.album,
		content: Faker::HeyArnold.quote,
		user_id: rand((User.first.id)..(User.last.id))
	)
	comment = Comment.create(
		content: Faker::HarryPotter.quote,
		user_id: rand((User.first.id)..(User.last.id)),
		gossip_id: rand((Gossip.first.id)..(Gossip.last.id))
	)
end