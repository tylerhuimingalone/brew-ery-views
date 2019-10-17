Rails.application.routes.draw do
  root 'homes#index'
  get '/breweries', to: 'homes#index'
  get '/breweries/new', to: 'homes#index'
  get '/breweries/:id', to: 'homes#index'
  get '/breweries/:id/reviews', to: 'homes#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :breweries, only: [:index, :create, :show] do
        resources :reviews, only: [:index]
      end
    end
  end
end
