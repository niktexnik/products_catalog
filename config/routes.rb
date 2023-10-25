Rails.application.routes.draw do
  devise_for :user_admins, ActiveAdmin::Devise.config
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Defines the root path route ("/")
  # root "product#index"
  post :login, to: 'sessions#login'
  post :create, to: 'sessions#create'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :products do
        resources :favourite
      end
    end
  end
  resources :users
  resources :products do
    resources :favourite, only: %i[create destroy]
  end
end
