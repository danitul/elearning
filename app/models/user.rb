class User < ApplicationRecord
  has_many :courses

  validates :email, presence: true, uniqueness: true
end
