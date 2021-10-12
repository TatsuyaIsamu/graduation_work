FactoryBot.define do
  factory :worship do
    worship_day {Date.today}
    weather  {2}
    image  {"/noimage.png"}
    memo  {"testMemo"}
    association  :shinto
    association  :user
  end
end
