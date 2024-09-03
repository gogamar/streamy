FactoryBot.define do
  factory :purchase_option do
    price { 1.99 }  # Default price
    video_quality { 'HD' }  # Default video quality

    trait :sd do
      video_quality { 'SD' }
    end

    trait :price_2_99 do
      price { 2.99 }
    end
  end
end
