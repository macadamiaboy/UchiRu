class StudentsController < ApplicationController
  before_action :set_school!, only: :index
  before_action :set_grade!, only: :index
  before_action :authenticate_or_request_with_http_token, only: %i[destroy show]

  after_action :add_header, only: :create

  def index
    @students = @grade.students
    render json: @students
  end

  def show
    @student = Student.find_by id: params[:id]
    render json: @student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new student_params
    if @student.save
      @token = ApiKey.create(bearer: @student)
      redirect_to schools_path
    else
      render :new
    end
  end

  def destroy
    @student = Student.find_by id: params[:id]
    @student.delete
    redirect_to schools_path
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

  def add_header
    response.headers['X-Auth-Token'] = @token
  end

  def authenticate_with_api_key
    authenticate_or_request_with_http_token do |token, options|
      @current_api_key = ApiKey.find_by_token(token)
      @current_bearer = current_api_key&.bearer
    end
  end
end
