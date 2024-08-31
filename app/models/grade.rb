class Grade < ApplicationRecord
  belongs_to :school
  has_many :students

  validates :number, presence: true
  validates :letter, presence: true
  validates :students_count, presence: true
end
