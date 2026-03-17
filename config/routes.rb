Rails.application.routes.draw do
  root "topics#index"

  resources :topics, only: [ :index, :show ]

  resources :problems, only: [ :show ] do
    post :check_answer, to: "attempts#create"
    get :solution, to: "solutions#show"
  end

  resources :favorites, only: [ :create, :destroy ]
end
