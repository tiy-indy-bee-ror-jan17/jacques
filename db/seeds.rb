# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  User.create!(
    username: Faker::LordOfTheRings.character,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )
end

1000.times do
  note = Note.new(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraphs(8).join("\n\n")
  )
  note.user = User.find(User.pluck(:id).sample)
  5.times do
    note.tags << Tag.find_or_initialize_by(name: Faker::Ancient.god)
  end
  note.save!


end
