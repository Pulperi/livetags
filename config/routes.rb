Rails.application.routes.draw do
  root 'static_pages#index'

  resource :session, only: [:new, :create, :destroy]

  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy]
  resources :media_tags

  get 'signup', to: 'users#new'
end
