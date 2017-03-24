# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |u|
  user = User.create!(
  username: Faker::Beer.name,
  email: Faker::Internet.email,
  password: "playground"
  )
  3.times do
    note = user.notes.create!(
    title: Faker::Book.title,
    body: Faker::TwinPeaks.quote
    )
    3.times do
      note.tags.find_or_create_by!(
      name: Faker::Pokemon.name
      )
    end
  end
end
