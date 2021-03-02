FactoryBot.define do
  factory :item do
    name               {Faker::Name.name}
    description        {Faker::Lorem.sentence}
    price              {1500}
    category_id        {2}
    status_id          {2}
    shopping_charge_id {2}
    shopping_area_id   {2}
    days_to_shop_id    {2}

    after(:build) do |product|
      product.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
