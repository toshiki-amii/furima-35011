FactoryBot.define do
  factory :buy_buyer do
    postal { '111-1111' }
    prefecture_id { 3 }
    city { '大阪市' }
    address { 'よかろうもん' }
    building { '森ビル' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
