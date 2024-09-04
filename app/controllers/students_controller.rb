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

  def new
    @student = Student.new
  end

  def create
    @student = Student.new student_params
    if @student.save
      redirect_to schools_path
    else
      render :new
    end
  end

  private
  def set_school!
    @school = School.find params[:school_id]
  end

  def set_grade!
    @grade = @school.grades.find params[:grade_id]
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :school_id, :grade_id)
  end
end
