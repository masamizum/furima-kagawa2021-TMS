FactoryBot.define do
  factory :user do
    nickname {"aaaa"}
    email {"123a@aaaa.com"}
    password {"a12345"}
    password_confirmation {"a12345"}
    last_name {"全角"}
    first_name {"全角"}
    last_name_kana {"カナ"}
    first_name_kana {"カナ"}
    birth_date {"1968-01-23"}
  end
end


#Email can't be blank
#Password can't be blank
#Encrypted password Password is invalid. Include both letters and numbers, Last name can't be blank, Last name name is invalid. Input full-width characters, First name can't be blank, First name name is invalid. Input full-width characters, First name kana can't be blank, First name kana name kana is invalid. Input full-width katakana characters, Last name kana can't be blank, Last name kana name kana is invalid. Input full-width katakana characters, Birth date can't be blank
