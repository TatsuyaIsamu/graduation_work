FactoryBot.define do
  factory :conversation do
    association :sender, factory: :user
    association :recipient, factory: :other_user
  end
end
