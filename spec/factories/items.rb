FactoryBot.define do
  factory :item do
    brand_name           {Faker::Lorem.sentence}
    expository_writing   {Faker::Lorem.sentence}
    category_id             { 2 }
    condition_id            { 2 }
    delivery_charge_id      { 2 }
    prefecture_id           { 2 }
    days_to_ship_id         { 2 }
    # メモ　この書き方だと、idが１の---も選択されてしまい、バリデーションに引っかかるのでidを直接選択。
    # days_to_ship_id         {Category.all.sample}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end