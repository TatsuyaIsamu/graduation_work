FactoryBot.define do
  factory :shinto_user_param do
    association   :user
    association   :shinto
  end
end
