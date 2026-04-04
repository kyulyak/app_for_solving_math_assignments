Rails.application.routes.draw do
  root "topics#index"
  devise_for :users

  resources :problems, only: [ :show ] do
    post :check_answer, to: "attempts#create"
  end

  resources :favorites, only: [ :create, :destroy ]

  resources :topics do
    resources :subtopics, only: [ :show ]
  end
end
