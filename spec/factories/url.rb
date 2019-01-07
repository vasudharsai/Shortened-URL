FactoryBot.define do
  factory :url do
    original_url  { Faker::Lorem.words.join }
    shortened_url { Faker::Lorem.characters(3) }
  end
end
