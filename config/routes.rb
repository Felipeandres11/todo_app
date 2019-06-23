Rails.application.routes.draw do
  get '/todos/lista', to: 'todos#lista'
  resources :todos
  #delete 'todos/:id', to: 'todos#destroy'
  get '/todos', to: 'todos#index'
  get '/todos/new', to: 'todos#new'
  get '/todos/:id/edit', to: 'todos#edit', as: 'edit'
  patch '/todos/:id', to: 'todos#update'
  post '/todos/create', to: 'todos#create'
  delete '/todos/:id', to: 'todos#destroy'

  get '/todos/:id', to: 'todos#show'
  get '/todos/:id/complete', to: 'todos#complete', as: 'complete'


end
