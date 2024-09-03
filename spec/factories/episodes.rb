FactoryBot.define do
  factory :episode do
    title { "Episode Title" }
    plot { "Episode Plot" }
    number { 1 }
    association :season
  end
end
