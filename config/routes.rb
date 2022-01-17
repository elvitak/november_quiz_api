Rails.application.routes.draw do
  namespace :api do
    resources :quizzes, only: [:create]
    resource :payments, only: :create
  end
end
