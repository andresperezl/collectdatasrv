Rails.application.routes.draw do
  post '/data', to: 'data#create'
  post '/experiment', to: 'experiment#create'
  get 'experiment/:id', to: 'experiment#show'
  root 'experiment#index'
end
