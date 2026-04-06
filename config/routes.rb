Rails.application.routes.draw do
  root "topics#index"

  devise_for :users

  resources :topics do
    resources :subtopics, only: [ :show ] do
      resources :problems, only: [ :show ]
    end
  end

  resources :problems, only: [ :show ] do
    post :check_answer, on: :member
  end

  resources :favorites, only: [ :create, :destroy ]
end
