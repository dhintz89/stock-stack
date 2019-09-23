Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get '/securities/find' => 'securities#new'
  resources :users, except: [:index]
  resources :securities do
    resources :watchlists, only: [:new]
  end
  resources :watchlists do
    resources :securities, only: [:index, :new, :create]
  end
  post '/securities/:id' => 'securities#refresh'


  get '/signin' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
end