FactoryBot.define do
  factory :user_introduction do
    address   {1}
    introduction    {"testText"}
    association   :user
  end
end
