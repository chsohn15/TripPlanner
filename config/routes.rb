Rails.application.routes.draw do
  resources :countries, only: [:index]
  resources :cities, only: [:index]
  resources :locations, only: [:index, :show]
  resources :trips
  resources :states, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
