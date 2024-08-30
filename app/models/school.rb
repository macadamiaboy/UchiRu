class School < ApplicationRecord
  has_many :grades
  has_many :students
end
