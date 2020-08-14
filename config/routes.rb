Rails.application.routes.draw do
  resources :countries
  resources :cities
  resources :locations
  resources :trips
  resources :states
  resources :trip_locations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
