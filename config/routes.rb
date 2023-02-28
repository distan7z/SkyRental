Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :drones, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy]
  namespace :admin do
    resources :bookings, only: [:index, :show]
    post 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
    post 'bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
    resources :drones
  end
end
