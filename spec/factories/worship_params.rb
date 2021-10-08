FactoryBot.define do
  factory :worship_param do
    title { "testTitle" }
    points { 1 }
    memo { "testMemo" }
    association  :worship
  end
end
