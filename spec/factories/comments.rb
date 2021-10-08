FactoryBot.define do
  factory :comment do
    comment {'testComment'}
    association :worship
    user_id  {worship.user.id}
  end
end
