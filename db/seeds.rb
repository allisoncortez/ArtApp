# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  the_lonely_art_club = Challenge.create(name: "The Lonely Art Club")

  portraits_challenge = Challenge.create(name: "Portraits")

#   9.times.do
#       User.create([{
#           name: Faker::Artist.name,
#           email: Faker::Internet.email,
#           password: Faker::Lorem.word,
#           image: Faker::Avater.image
#       }])
#   end