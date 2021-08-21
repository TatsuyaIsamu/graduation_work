FactoryBot.define do
  factory :worship do
    worship_day { "2021-08-21" }
    weather { 1 }
    memo { "MyText" }
    image { "MyString" }
    user { nil }
    shinto { nil }
  end
end
