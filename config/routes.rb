Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Defines the root path route ("/")
  # root "product#index"
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
