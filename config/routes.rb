Rails.application.routes.draw do
  root "topics#index"

  devise_for :users

  get "dashboard", to: "dashboard#index"
  get "dashboard/progress", to: "dashboard#progress", as: :dashboard_progress
  get "dashboard/favorites", to: "dashboard#favorites", as: :dashboard_favorites
  get "dashboard/history", to: "dashboard#history", as: :dashboard_history

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
