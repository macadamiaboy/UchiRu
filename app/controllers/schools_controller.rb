class SchoolsController < ApplicationController

  before_action :set_school!, only: %i[destroy]
  
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def destroy
    @school.students.each do |student|
      student.delete
    end
    @school.grades.each do |grade|
      grade.delete
    end
    @school.delete
    #redirect_to Something_path
  end

  private
  def set_school!
    @school = School.find params[:id]
  end

end
