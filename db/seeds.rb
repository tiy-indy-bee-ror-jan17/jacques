# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

5.times do
  fake_user = User.create!(
    username: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    # avatar: Faker::LoremPixel.image("100x100")
  )
  3.times do
    tags = []
    Faker::Coffee.notes.split(/\s*,\s*/).each do |name|
      tags << Tag.find_or_initialize_by(name: name)
    end
    fake_user.notes.create!(
      title: Faker::Coffee.origin,
      body: Faker::Lorem.paragraph,
      tags: tags
    )
  end
  fake_user.save!
end
