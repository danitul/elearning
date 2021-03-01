FactoryBot.define do
  factory :course do
    name { 'Course Beginner' }
    description { 'This course is about nothing' }
    type { 'Young Professionals' }
    status { Course::STATUS[:enrolled] }
    lessons do
      Array.new() { a.association(:lessons) }
    end
  end
end
