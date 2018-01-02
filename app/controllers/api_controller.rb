class ApiController < ActionController::Base
  def index
    render json: {
        test: 'gg'
    }
  end
end
