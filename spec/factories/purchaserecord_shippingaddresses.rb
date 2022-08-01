FactoryBot.define do
  factory :purchaserecord_shippingaddress do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '0332033304' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
