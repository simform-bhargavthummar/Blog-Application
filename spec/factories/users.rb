FactoryBot.define do
  factory :user do
    email { "test_email@gmail.com" }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa' }
  end
end
