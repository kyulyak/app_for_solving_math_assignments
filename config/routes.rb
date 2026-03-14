Rails.application.routes.draw do
  root "pages#home"

  # Аутентификация
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Регистрация
  resources :users, only: [ :new, :create, :show ]

  # Основные ресурсы
  resources :topics, only: [ :index, :show ] do
    resources :problems, only: [ :index, :show ]
  end

  resources :problems do
    member do
      post "check"
      post "favorite"
      delete "unfavorite"
    end
  end

  resources :reference_materials, only: [ :index, :show ]

  # Личный кабинет
  get "/dashboard", to: "dashboard#index"
  get "/dashboard/progress", to: "dashboard#progress"
  get "/dashboard/favorites", to: "dashboard#favorites"
  get "/dashboard/history", to: "dashboard#history"

  # API для проверки решений
  namespace :api do
    namespace :v1 do
      post "/problems/:id/check", to: "problems#check"
    end
  end

  resources :categories, only: [ :index, :show ]
  resources :tasks, only: [ :show ] do
    resources :attempts, only: [ :create ]
    member do
      get :solution
    end
  end
end
