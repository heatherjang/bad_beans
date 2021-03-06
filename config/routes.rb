RottenMangoes::Application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end

  get '/search', to: 'movies#index'

  root to: 'movies#index'


end

