Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#index'

  resources :dashboards
  resources :customers
  resources :tables

end
