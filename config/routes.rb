Rails.application.routes.draw do
  devise_for :users
  root to: 'sales#index'

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

  resource :report do
    member do
      get :order
      get :waiter
      get :dish
      get :pdfdish
      get :pdfwaiter
      get :pdforder
    end
  end


end
