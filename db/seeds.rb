# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do

  username = Faker::Internet.user_name

  user = User.create!(
    username: username,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )

  5.times do
    note = user.notes.create!(
      title: Faker::Beer.name,
      body: Faker::Friends.quote
    )

    2.times do
      note.tags.find_or_create_by!(
      name: Faker::Friends.character
      )
    end
  end
end
