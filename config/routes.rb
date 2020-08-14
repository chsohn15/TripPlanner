Rails.application.routes.draw do
  resources :countries do 
    resources :states do
      resources :cities do
        resources :locations
      end
    end
  end

  # resources :locations
  resources :trips
  resources :trip_locations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
