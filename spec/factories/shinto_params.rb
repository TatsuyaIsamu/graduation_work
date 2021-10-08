FactoryBot.define do
  factory :shinto_param do
    memo  {"testMemo"}
    association :shinto_user_param
  end
end
