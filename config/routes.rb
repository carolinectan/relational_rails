Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  ##### Garden and Plant Routes #############
  
  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  get '/gardens/:id', to: 'gardens#show'
  post '/gardens', to: 'gardens#create'
  get '/gardens/:id/edit', to: 'gardens#edit'
  patch '/gardens/:id', to: 'gardens#update'

  get '/plants', to: 'plants#index'
  get '/plants/:id', to: 'plants#show'
  get '/plants/:id/edit', to: 'plants#edit'
  patch '/plants/:id', to: 'plants#update'

  get '/gardens/:garden_id/plants', to: 'garden_plants#index'
  get '/gardens/:garden_id/plants/new', to: 'garden_plants#new'
  post '/gardens/:garden_id/plants', to: 'garden_plants#create'
  
  ##### Farm and Farmer Routes #############

  get '/farms', to: 'farms#index'
  get '/farms/new',  to: 'farms#new'
  post '/farms', to: 'farms#create'
  get '/farms/:id', to: 'farms#show'
  get '/farms/:id/edit', to: 'farms#edit'
  patch '/farms/:id', to: 'farms#update'
  delete '/farms/:id', to: 'farms#destroy'

  get '/farmers', to: 'farmers#index'
  get '/farmers/:id', to: 'farmers#show'
  get '/farmers/:id/edit', to: 'farmers#edit'
  patch '/farmers/:id', to: 'farmers#update'
  delete '/farmers/:id', to: 'farmers#destroy'

  get '/farms/:farm_id/farmers/new',  to: 'farmers#new'
  post '/farms/:farm_id/farmers', to: 'farmers#create'
  get '/farms/:farm_id/farmers', to: "farm_farmers#index"
  delete '/farms/:farm_id/farmers', to: "farm_farmers#destroy"
end
