class ApiController < ActionController::Base
  def index
    render json: {
        message: 'welcome'
    }
  end
end
