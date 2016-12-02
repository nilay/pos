Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#index'

  resources :dashboards
  resources :customers
  resources :tables
  resources :categories do
    resources :dishes
  end
  resources :dishes
  resources :sales do
    resources :payments
    resources :line_items
  end

end
