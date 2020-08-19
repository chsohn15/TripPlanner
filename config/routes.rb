Rails.application.routes.draw do
  resources :users, except: [:index]
  get "/", to: "countries#index", as: "home"
  resources :states, only: [:index]
  resources :states, only: [:show] do
    resources :cities, only: [:index]
  end

  resources :cities, only: [:show] do
    resources :locations, only: [:index, :show, :edit, :update]
  end
   
  resources :trips do
    resources :trip_locations, except: [:index, :new, :create]
  end
  
  get "/cities/:city_id/locations/:id/reviews", to: "locations#reviews", as: "city_location_reviews"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: "sessions#login"
  post '/login', to: "sessions#process_login"
  delete '/logout', to: "sessions#logout"


end
