FactoryBot.define do
  factory :shinto_param_item do
    title {"MyString"}
    points {1.5}
    association   :shinto_param
  end
end
