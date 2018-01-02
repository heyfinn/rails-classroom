Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :students
    get "/students", to: "student#index"
    post "/students", to: "student#create"
    put "/students/{id}", to: "student#update"
  end
end
