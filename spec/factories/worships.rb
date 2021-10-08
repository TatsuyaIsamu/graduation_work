FactoryBot.define do
  factory :worship do
    worship_day {"2021-08-21"}
    weather   {2}
    image   {"/noimage.png"}
    memo    {"testMemo"}
    association   :shinto
    association   :user
  end
end
