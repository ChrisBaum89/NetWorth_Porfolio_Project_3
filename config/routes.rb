Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :categories, only: [:new, :create, :show, :index, :edit, :update]
  resources :accounts, only: [:new, :create, :show, :index, :edit, :update]
  resources :users, only: [:new, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
