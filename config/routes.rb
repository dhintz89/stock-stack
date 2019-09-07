Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get '/securities/find' => 'securities#find'
  resources :users, except: [:index]
  resources :securities, :watchlists
  post '/securities/show' => 'securities#show'
  post '/securities/:id' => 'securities#refresh'


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
end