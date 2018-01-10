class Api::SearchController < ApplicationController
  def index
    keyword = params[:keyword].downcase

    if !keyword
      render json: {
          message: 'Please provide a keyword to search!'
      }, status: 400
      return
    end

    # Query student attributes within keyword
    @students = Student.where(
        "lower(CONCAT_WS(email, ' ', first_name, ' ', last_name))  LIKE ?",
        "%#{keyword}%"
    ).sort_by {|s| s.id}

    # Query classroom name within keyword
    @classrooms = Classroom.where(
        "lower(name) like ?",
        "%#{keyword}%"
    ).sort_by {|c| c.id}

    render json: {
        data: {
            students: @students,
            classrooms: @classrooms
        }
    }, status: 200
  end
end
