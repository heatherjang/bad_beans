# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!(
  title: "Monsters, Inc.",
  director: "Pete Docter",
  runtime_in_minutes: 92,
  description: "Monsters generate their city's power by scaring children, but they are terribly afraid themselves of being contaminated by children, so when one enters Monstropolis, top scarer Sulley finds his world disrupted.",
  release_date: "2002-02-08",
  poster_image_url: "http://concertposter.org/-2013Mar/Monsters-Inc/Monsters-Inc-All-TeaserNT-drop.jpg"
)