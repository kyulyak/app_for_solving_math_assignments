Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "topics#index"

  devise_for :users

  get "/progress", to: "progress#show", as: :progress

  get "dashboard", to: "dashboard#index"
  get "dashboard/progress", to: "dashboard#progress", as: :dashboard_progress
  get "dashboard/favorites", to: "dashboard#favorites", as: :dashboard_favorites
  get "dashboard/history", to: "dashboard#history", as: :dashboard_history

  get "/reference", to: "reference#index", as: :reference
  get "/reference/:topic_id", to: "reference#show", as: :reference_topic

  resources :topics do
    resources :subtopics, only: [ :show ] do
      resources :problems, only: [ :show ] do
        post :check_answer, on: :member
        post :next_generated, on: :member
        post :show_solution, on: :member
      end
    end
  end

  resources :reference, only: [ :index, :show ] do
  resources :notes, only: [ :create, :update, :destroy ]
  end

  resources :favorites, only: [ :create, :destroy ]
end
