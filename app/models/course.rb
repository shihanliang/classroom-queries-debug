class Course < ApplicationRecord
  belongs_to :department

  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
end
