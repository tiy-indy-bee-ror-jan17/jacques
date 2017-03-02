# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


note = Note.create!(title: "My awesome post", body: "My awesome body of a post")

note2 = Note.create!(title: "My awesome second post", body: "My awesome body of a second post")

note.tags.create!([{ name: "awesome" }, { name: "funny" }, { name: "spiffy" }])

note2.tags.create!([{ name: "not_so_awesome" }, { name: "not_funny" }, { name: "not_at_all_spiffy" }])

user = User.create!(username: "bugsy", password: "cupcakes")
