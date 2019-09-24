Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  # users routes
  resources :users, except: [:index]

  # securities routes
  get '/securities/find' => 'securities#new'
  resources :securities do
    resources :watchlists, only: [:new]
    collection do
      get 'best_performing'
    end
  end

  # watchlists routes
  resources :watchlists do
    resources :securities, only: [:index, :new, :create]
  end
  post '/securities/:id' => 'securities#refresh'

  # sessions routes
  get '/signin' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
end