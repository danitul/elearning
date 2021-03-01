FactoryBot.define do
  factory :assignment do
    sequence(:name) { |n| "Assignment #{n}" }
    content_type { Assignment::CONTENT_TYPES[:video] }
    content_url { 'www.assignment.com' }
    is_done { false }
  end
end
