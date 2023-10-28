Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :user_admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      post :login, to: 'sessions#login'
      post :create, to: 'sessions#create'
      post :destroy, to: 'sessions#destroy'
      resources :users
      resources :products do
        collection do
          resources :favourites, only: %i[create destroy]
        end
      end
    end
  end
end
