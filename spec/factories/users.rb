FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    firstname_in_kanji    { '太郎' }
    lastname_in_kanji     { '山田' }
    firstname_in_kana     { 'タロウ' }
    lastname_in_kana      { 'ヤマダ' }
    birthday              { '1990-07-10' }
  end
end
