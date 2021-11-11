Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/admin/home' => 'admin#home'

  #category paths
  resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  #account paths
  resources :accounts, only: [:new, :create, :show, :edit, :update, :destroy]

  #user paths
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:show] do
    resources :accounts, only: [:index, :show, :new]
  end



end
