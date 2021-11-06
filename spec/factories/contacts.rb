FactoryBot.define do
  factory :contact do
    name { 'MyString' }
    email { 'test@gmail.com' }
    content { 'MyText' }
  end
end
