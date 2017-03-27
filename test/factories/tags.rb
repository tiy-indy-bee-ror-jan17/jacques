FactoryGirl.define do
  factory :tag do
    name { Faker::Company.unique.buzzword.gsub(%r(\s), "_") }
  end
end
