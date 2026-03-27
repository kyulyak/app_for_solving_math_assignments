Rails.application.routes.draw do
  root "topics#index"
  devise_for :users
  resources :topics

  resources :problems, only: [ :show ] do
    post :check_answer, to: "attempts#create"
  end

  resources :favorites, only: [ :create, :destroy ]
end
