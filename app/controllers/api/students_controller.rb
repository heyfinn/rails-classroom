class Api::StudentsController < ApiController
  def index
    @students = Student.all
    render json: {
        data: @students
    }
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
          status: 200,
          data: student,
          message: 'Successfully created user ' + student.first_name
      }.to_json
    else
      render json: {
          status: 500,
          errors: student.errors
      }.to_json
    end
  end

  def update
    begin
      student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          status: 403,
          message: "Find no student with id #{params[:id]}",
          errors: e.to_s
      }

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
          status: 200,
          data: student
      }.to_json
    else
      render json: {
        status: 500,
        errors: student.errors
      }
    end
  end

  def delete
    student = Student.find
  end
end
