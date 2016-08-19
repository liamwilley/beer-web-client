Rails.application.routes.draw do
  get '/beers', to: 'beers#index'
  get '/beers/new', to: 'beers#new'
  post '/beers/create', to: 'beers#create'
  get '/beers', to: 'beers#show'

  get '/beers/:id/edit', to: 'beers#edit'
  patch '/beers/:id', to: 'beers#update'
  delete '/beers/:id', to: 'beers#destroy'

end
