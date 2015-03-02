Rails.application.routes.draw do
  post '/data', to: 'data#create'
  post '/experiment', to: 'experiment#create'
  root 'data#show'
end
