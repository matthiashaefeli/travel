Rails.application.routes.draw do
  devise_for :users
  resources :travel_times
  root to: 'home#index'
end
