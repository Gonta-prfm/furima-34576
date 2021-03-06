FactoryBot.define do
  factory :purchase_street_address do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {'123-4567'}
    prefecture_id {2}
    municipality  {"札幌市"}
    address       {"北区6-4"}
    buliding_name {"札幌駅"}
    phone_number  {'12345678912'}
  end
end