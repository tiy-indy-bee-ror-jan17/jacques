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
    username: Faker::Internet.unique.name,
    email: Faker::Internet.unique.safe_email,
    password: "password",
    created_at: rand_time(2.years.ago).to_formatted_s(:long_ordinal)
  )
  5.times do
    note = Note.create(
      title: Faker::Overwatch.quote,
      body: Faker::ChuckNorris.fact,
      user_id: user.id,
      created_at: rand_time(2.years.ago).to_formatted_s(:long_ordinal)
    )
    5.times do
      tag = Tag.create(
        name: Faker::Book.genre,
        created_at: rand_time(2.years.ago).to_formatted_s(:long_ordinal)
      )
      Taggings.create(
        tag_id: tag.id,
        note_id: note.id,
        created_at: rand_time(2.years.ago).to_formatted_s(:long_ordinal)
      )
    end
  end
end
