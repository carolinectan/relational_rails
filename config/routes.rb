Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'

  get '/farms', to: 'farms#index'
  get '/farms/new',  to: 'farms#new'
  post '/farms', to: 'farms#create'
  get '/farms/:id', to: 'farms#show'

  get '/farmers', to: 'farmers#index'
  get '/farmers/:id', to: 'farmers#show'

  get '/farms/:id/farmers', to:"farm_farmers#index"

  get '/plants', to: 'plants#index'
  get '/gardens/:garden_id/plants', to: 'garden_plants#index'

  get '/gardens/:id', to: 'gardens#show'
  get '/plants/:id', to: 'plants#show'
end
