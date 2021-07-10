Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  get '/gardens/:id', to: 'gardens#show'
  post '/gardens', to: 'gardens#create'
  get '/gardens/:id/edit', to: 'gardens#edit'
  patch '/gardens/:id', to: 'gardens#update'

  get '/farms', to: 'farms#index'
  get '/farms/:id', to: 'farms#show'

  get '/farmers', to: 'farmers#index'
  get '/farmers/:id', to: 'farmers#show'

  get '/farms/:id/farmers', to:"farm_farmers#index"

  get '/plants', to: 'plants#index'
  get '/plants/:id', to: 'plants#show'
  get '/gardens/:garden_id/plants', to: 'garden_plants#index'





end
