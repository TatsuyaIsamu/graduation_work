FactoryBot.define do
  factory :user do
    name  {"testuser"}
    email  {"test@gmail"}
    password  {"111111"}
    password_confirmation  {"111111"}
  end
  factory :other_user, class: User do
    name  {"otheruser"}
    email  {"other@gmail"}
    password  {"111111"}
    password_confirmation  {"111111"}
  end

end
