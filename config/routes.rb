Rails.application.routes.draw do

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  get 'users/home'

  get 'users/login'

  get 'users/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/', to: 'users#home', via: 'get'

  match '/signup', to: 'users#new', via: 'get'

  match '/signin',  to: 'sessions#new', via: 'get'

  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
