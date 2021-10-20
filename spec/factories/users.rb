FactoryBot.define do
  factory :user do
    nickname { 'aaaa' }
    email { '123a@aaaa.com' }
    password { 'a12345' }
    password_confirmation { 'a12345' }
    last_name { '全角' }
    first_name { '全角' }
    last_name_kana { 'カナ' }
    first_name_kana { 'カナ' }
    birth_date { '1968-01-23' }
  end
end
