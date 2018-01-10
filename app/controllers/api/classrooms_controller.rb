class Api::ClassroomsController < ApiController
  def index
    @classrooms = Classroom.all
    render json: {
        data: @classrooms
    }, status: 200
  end

  def create
    @classroom = Classroom.new
    @classroom.name = params[:name]

    if @classroom.save
      render json: {
          class_id: @classroom.id,
          message: 'Successfully create a classroom!'
      }, status: 201
    else
      render json: {
          errors: @classroom.errors
      }, status: 500
    end
  end

  def show
    @students = Student.where(:class_id => params[:id])

    begin
      @classroom = Classroom.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          message: "Find no classroom with id #{params[:id]}",
          errors: e.to_s
      }, status: 404

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

    if @classroom.save
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
