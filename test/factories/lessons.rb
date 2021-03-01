FactoryBot.define do
  factory :lesson do
    sequence(:name) { |n| "Lesson #{n}" }
    description { 'This lesson is about nothing' }
    is_done { false }
    assignments do
      Array.new() { a.association(:assignments) }
    end
  end
end
