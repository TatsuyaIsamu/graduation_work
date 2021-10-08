FactoryBot.define do
  factory :favorite_shinto do
    association :user
    association :shinto
  end
end
