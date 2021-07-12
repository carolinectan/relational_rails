Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

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

  get '/farms/:farm_id/farmers/new',  to: 'farmers#new'
  post '/farms/:farm_id/farmers', to: 'farmers#create'

  get '/farmers/:id/edit', to: 'farmers#edit'
  patch '/farmers/:id', to: 'farmers#update'

  delete '/farmers/:id', to: 'farmers#destroy'

  get '/farms/:farm_id/farmers', to: "farm_farmers#index"
  delete '/farms/:farm_id/farmers', to: "farm_farmers#destroy"

##### Garden and Plant Routes #############

  get '/gardens', to: 'gardens#index'

  get '/plants', to: 'plants#index'
  get '/gardens/:garden_id/plants', to: 'garden_plants#index'

  get '/gardens/:id', to: 'gardens#show'
  get '/plants/:id', to: 'plants#show'
end
