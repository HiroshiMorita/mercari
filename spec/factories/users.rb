FactoryBot.define do

  factory :user do
    password = "hanako1234"

    nickname               {"ヤマハナ"}
    email                  {"taro@example.com"}
    password               {password}
    password_confirmation  {password}
    kan_familyname         {"山田"}
    kan_firstname          {"花子"}
    kana_familyname        {"ヤマダ"}
    kana_firstname         {"ハナコ"}
    birth_day              {20000131}
    phone_number           {90912345678}
  end
end