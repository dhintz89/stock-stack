Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  
  # sessions routes
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # users routes
  get '/users/:id' => 'users#show', as: 'user'

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

end