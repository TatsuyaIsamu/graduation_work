FactoryBot.define do
  factory :message do
    body { 'testBody' }
    association :conversation
    user_id { conversation.sender_id }
  end
end
