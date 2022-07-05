FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 4, min_numeric: 1) }
    # メモ　ランダムな６文字を生成、最低４文字以上はアルファベットを含める、最低１文字以上は数字を含める
    password_confirmation { password }
    family_name { Gimei.family.kanji }
    first_name { Gimei.first.kanji }
    family_name_kana { Gimei.family.katakana }
    first_name_kana { Gimei.first.katakana }
    birthday { Faker::Date.backward }
  end
end
