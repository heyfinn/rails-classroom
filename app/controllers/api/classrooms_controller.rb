class Api::ClassroomsController < ApiController
  def index
    @classrooms = Classroom.all
    render status: 200, json: {
        data: @classrooms
    }
  end

  def create
    @classroom = Classroom.new
    @classroom.name = params[:name]

    if @classroom.save
      render status: 200, json: {
          class_id: @classroom.id,
          message: 'Successfully create a classroom!'
      }
    else
      render status: 500, json: {
          errors: @classroom.errors
      }
    end
  end

  def show
    @students = Student.where(:class_id => params[:id])

    begin
      @classroom = Classroom.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          status: 400,
          message: "Find no classroom with id #{params[:id]}",
          errors: e.to_s
      }

      return
    end

    render json: {
        data: @students,
        classroomName: @classroom.name
    }, status: 200

  end

  def update
    begin
      @classroom = Classroom.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          status: 400,
          message: "Find no classroom with id #{params[:id]}",
          errors: e.to_s
      }

      return
    end

    @classroom.name = params[:name]

    if (@classroom.save)
      render json: {
          message: 'Successfully update classroom'
      }, status: 200
    else
      render json: {
          errors: @classroom.errors
      }, status: 500
    end
  end

end
