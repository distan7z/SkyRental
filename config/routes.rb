Rails.application.routes.draw do
  root to: 'pages#home'
  resources :drones, only: [:index, :show] do
    resources :bookings, only: [:new, :create] #to be deleted?
    resources :reviews, only: :create
  end

  resources :bookings, only: [:index, :create, :show, :destroy]
  namespace :admin do
    resources :bookings, only: [:index, :show]
    post 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
    post 'bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
    resources :drones
  end

  devise_for :users
  resources :users, only: [:show]
end
