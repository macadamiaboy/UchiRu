class GradesController < ApplicationController
  before_action :set_school!

  def index
    @grades = @school.grades
    render json: @grades
  end

  private
  def set_school!
    @school = School.find params[:school_id]
  end
end
