FactoryBot.define do
  factory :favorite_worship do
    association :worship
    user_id {worship.user.id}
  end
end
