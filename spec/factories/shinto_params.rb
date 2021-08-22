FactoryBot.define do
  factory :shinto_param do
    title { "MyString" }
    points { 1 }
    memo { "MyText" }
    favorite_shinto { nil }
  end
end
