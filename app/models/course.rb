class Course < ApplicationRecord
  #this should be moved to a UserCourse table, unless we create a separate customized course for each user, then it's fine here
  STATUS = { enrolled: 0, completed: 1 }
  enum status: STATUS

  belongs_to :user

  has_many :lessons
end
