Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  get '/admin/home' => 'admin#home'

  resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :categories, only: [:index] do
    resources :users, only:[:index]
  end

  resources :accounts, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
