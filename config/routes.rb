Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get "/", to: "tasks#index"
  resources :tasks

  namespace :admin do
    resources :tags
    resources :users do
      collection do
        get "/role/:id", to: "users#role", as: "user_role"
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
