FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'MyString' }
    role { User.roles.keys.sample }
    prefecture
  end
end
