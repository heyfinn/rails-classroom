Rails.application.routes.draw do
  get "/api", to: "api#index"

  namespace :api, defaults: { format: :json } do
    resources :students, :classrooms
    get "/classrooms/students", to: "classroom#get_students"
    # get "/students", to: "student#index"
    # post "/students", to: "student#create"
    # put "/students/{id}", to: "student#update"
  end
end
