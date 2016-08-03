Rails.application.routes.draw do
  resources :sessions
  resources :leagues do
    resources :games
    resources :teams do
      resources :players
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
