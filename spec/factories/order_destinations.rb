FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    #prefecture_id { Faker::Numbar.between(from: 2, to: 48) }
    prefecture_id { 2 }
    #city { Faker::Address.city }
    city { "あいう市" }
    #addresses { Faker::Address.street_address }
    addresses { "１−１−１" }
    building { 'ハイツ' }
    #phone_number { '0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}' }
    phone_number { '09012345678' }

  end
end
