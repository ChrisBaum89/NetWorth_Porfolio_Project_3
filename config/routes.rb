Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  get '/admin/home' => 'admin#home'

  resources :categories, only: [:new, :create, :show, :index, :edit, :update]
  resources :accounts, only: [:new, :create, :show, :index, :edit, :update]
  resources :users, only: [:new, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
