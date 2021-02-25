FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    birth_day             {Faker::Date.backward}
    password              {Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) }
    password_confirmation {password}
    family_name           {person.first.kanji}
    first_name            {person.last.kanji}
    family_name_kana      {person.first.katakana}
    first_name_kana       {person.last.katakana}
  end
end