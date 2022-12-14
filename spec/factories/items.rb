FactoryBot.define do
  factory :item do
    name                      { Faker::Team.name }
    category_id               { Faker::Number.between(from: 2, to: 11) }
    status_id                 { Faker::Number.between(from: 2, to: 7) }
    information               { Faker::Lorem.sentence }
    price                     { Faker::Number.between(from: 300, to: 9_999_999) }
    prefecture_id             { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id     { Faker::Number.between(from: 2, to: 4) }
    delivery_charge_id        { Faker::Number.between(from: 2, to: 3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
