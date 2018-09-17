Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :events
  get '/api/events', to: 'events#index', as: :index

  post '/api/events', to: 'events#create', as: :create

  get '/api/events/:id', to: 'events#show', as: :show

  put '/api/events/:id', to: 'events#update', as: :update

  delete '/api/events/:id', to: 'events#destroy', as: :delete
end
