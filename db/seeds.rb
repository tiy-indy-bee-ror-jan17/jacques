# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def rand_time(from, to=Time.now)
  Time.at(rand(from.to_f..to.to_f))
end

10.times do
  user = User.create(
    name: Faker::Name.name,
    username: Faker::Internet.unique.user_name(8..20),
    email: Faker::Internet.unique.safe_email,
    password: "password",
    created_at: rand_time(2.years.ago).to_formatted_s(:long_ordinal)
  )
  5.times do
    note = Note.create(
      title: Faker::Beer.name,
      body: Faker::ChuckNorris.fact,
      user_id: user.id,
      created_at: rand_time(user.created_at).to_formatted_s(:long_ordinal)
    )
    5.times do
      note.tags << Tag.find_or_create_by(
        name: Faker::Book.genre
      )
    end
  end
end
