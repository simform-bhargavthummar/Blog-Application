FactoryBot.define do
  factory :blog do
    title { "MyString" }
    content { "MyText" }
    publication_date { "2024-03-13 16:42:09" }
    user { nil }
  end
end
