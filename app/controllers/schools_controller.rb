class SchoolsController < ApplicationController

  #before_action :set_school!, only: %i[destroy]
  
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new
    if @school.save
      redirect_to schools_path
    else
      render :new
    end
  end

  def show
    @school = School.find_by id: params[:id]
  end

=begin

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
=end

end
