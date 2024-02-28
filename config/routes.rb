Rails.application.routes.draw do
  devise_for :users

  get "dashboard", to: "pages#dashboard"
  get "dashboard/:id/edit", to: "pages#edit", as: :edit_offer
  patch "dashboard/:id/edit", to: "pages#update"
  root "cars#index"

  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show] do
    member do
      patch 'accept'
      patch 'deny'
    end
    # show, :index dans dashboard
    # booking /ACCEPT
    # booking /DENY
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
