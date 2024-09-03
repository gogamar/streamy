FactoryBot.define do
  factory :purchase do
    association :user
    association :purchase_option
    association :content, factory: :movie

    sequence(:price) { |n| 1.99 + n }
    sequence(:video_quality) { |n| n.even? ? "HD" : "SD" }
    expiration_time { 1.day.from_now }
    content_type { "Movie" }

    trait :unique_price_and_quality do
      sequence(:price) { |n| 1.99 + n }
      sequence(:video_quality) { |n| n.even? ? "HD" : "SD" }
    end
  end
end
