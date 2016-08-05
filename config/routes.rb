Rails.application.routes.draw do

  root 'leagues#index'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages
  resources :leagues do
    resources :games
    resources :teams do
      resources :players
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'players#new'
  post '/players' => 'players#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
