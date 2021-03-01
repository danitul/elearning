class Assignment < ApplicationRecord
  CONTENT_TYPES = {
    video: 0,
    watch: 1,
    read: 2,
    exercise: 3,
    feedback: 4,
    certificate: 5,
    quiz: 6,
    questionnaire: 7
  }
  enum content_type: CONTENT_TYPES

  belongs_to :lesson
end
