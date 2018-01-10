Rails.application.routes.draw do
  get "/api", to: "api#index"

  namespace :api, defaults: { format: :json } do
    resources :students, :classrooms
    get "/search", to: "search#index"
    # get "/students", to: "student#index"
    # post "/students", to: "student#create"
    # put "/students/{id}", to: "student#update"
  end
end
