Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy]

  get 'signup', to: 'users#new'

  root 'welcome#index'
end
