FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |n| "user#{n}@elearning.com" }
    courses do
      Array.new() { a.association(:courses) }
    end
  end
end
