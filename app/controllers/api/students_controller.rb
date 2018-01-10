class Api::StudentsController < ApiController
  def index
    @students = Student.all
    render json: {
        data: @students
    }, status: 200
  end

  def create
    student= Student.new
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.class_id = params[:class_id]
    student.email = params[:email]

    student.save

    if student.save
      render json: {
          data: student,
          message: 'Successfully created user ' + student.first_name
      }, status: 201
    else
      render json: {
          errors: student.errors
      }, status: 500
    end
  end

  def update
    begin
      student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          message: "Find no student with id #{params[:id]}",
          errors: e.to_s
      }, status: 404

      return
    end

    # Update if data provided
    _student = Hash.new
    if (params[:first_name])
      _student["first_name"] = params[:first_name]
    end
    if (params[:last_name])
      _student["last_name"] = params[:last_name]
    end
    if (params[:class_id])
      _student["class_id"] = params[:class_id]
    end
    if (params[:email])
      _student["email"] = params[:email]
    end
    # params[:first_name] && (_student.first_name = params[:first_name])
    # params[:last_name] && (_student.last_name = params[:last_name])
    # params[:class_id] && (_student.class_id = params[:class_id])
    # params[:email] && (_student.email = params[:email])

    # Save student
    if student.update(_student)
      render json: {
          data: student
      }, status: 204
    else
      render json: {
        errors: student.errors
      }, status: 500
    end
  end

  def show
    @student = trySearchStudent(params[:id])

    if @student
      render json: {
          data: @student
      }, status: 200
    end
  end

  def trySearchStudent(id)
    begin
      @student = Student.find(id)
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          message: "Find no student with id #{id}",
          errors: e.to_s
      }, status: 404

      return
    end

    return @student
  end

  def delete
    student = Student.find(params[:id])
  end
end
