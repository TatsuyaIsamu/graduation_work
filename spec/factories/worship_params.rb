FactoryBot.define do
  factory :worship_param do
    title { 'testParamTitle' }
    points { 1 }
    memo { 'testParamMemo' }
    association :worship
  end
end
