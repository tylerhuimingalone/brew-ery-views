Rails.application.routes.draw do
  root 'homes#index'
  get '/breweries', to: 'homes#index'
  get '/breweries/new', to: 'homes#index'
  get '/breweries/:id', to: 'homes#index'
  get '/breweries/:id/reviews', to: 'homes#index'
  post '/breweries/api/v1/reviews', to: 'api/v1/reviews#create'
  delete '/breweries/api/v1/reviews/:id', to: 'api/v1/reviews#delete'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :breweries, only: [:index, :create, :show] do
        resources :reviews, only: [:index]
      end
      resources :reviews, only: [:create, :delete]
    end
  end
end
