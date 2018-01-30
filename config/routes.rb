Rails.application.routes.draw do

  resources :users

  get 'users/home'

  get 'users/login'

  get 'users/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/', to: 'users#home', via: 'get'

  match '/signup', to: 'users#new', via: 'get'
end
