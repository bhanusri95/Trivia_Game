Rails.application.routes.draw do

  resources :users

  resources :trivia do
    member { post :vote }
  end
  

  resources :sessions, only: [:new, :create, :destroy]

  match '/', to: 'users#home', via: 'get'

  get 'users/home'

  get 'users/login'

  get 'users/register'

  post 'trivia/check_ans'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 

  match '/signup', to: 'users#new', via: 'get'

  match '/signin',  to: 'sessions#new', via: 'get'

  match '/signout', to: 'sessions#destroy', via: 'get'
  
  match '/answer', to: 'trivia#ans_trivia', via: 'get'

  match '/highscore', to: 'trivia#Highs', via: 'get'

end
