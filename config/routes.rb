Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :car_models, only: %i[show new create]
  resources :subsidiaries, only: %i[show new create]
  resources :cars, only: %i[show new create]
  resources :customers, only: %i[show new create]
  resources :maintenances, only: %i[show new create]
end
