class StudentsController < ApplicationController
  before_action :set_school!, only: :index
  before_action :set_grade!, only: :index

  def index
    @students = @grade.students
    render json: @students
  end

  def show
    @student = Student.find_by id: params[:id]
  end

  private
  def set_school!
    @school = School.find params[:school_id]
  end

  def set_grade!
    @grade = @school.grades.find params[:grade_id]
  end

end
