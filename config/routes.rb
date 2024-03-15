Rails.application.routes.draw do
  root to: 'users#new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'users/create'
  resources :users, only: [:show, :create, :new]
  get    'login',  to: 'sessions#new',     as: 'login'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :orders, only: [:new, :create, :show]
  resources :cart_items, only: [:show, :create, :update, :destroy]
  resource :cart, only: [:show]
  resources :products, only: [:index, :show]

end
