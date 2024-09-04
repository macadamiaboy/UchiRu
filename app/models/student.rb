class Student < ApplicationRecord
  belongs_to :grade
  belongs_to :school
  
  validates :first_name, presence: true, length: {minimum: 1}
  validates :last_name, presence: true, length: {minimum: 1}
  validates :surname, presence: true, length: {minimum: 1}
end
