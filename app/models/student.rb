class Student < ApplicationRecord
  belongs_to :grade
  belongs_to :school
end
