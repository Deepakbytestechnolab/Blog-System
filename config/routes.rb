Rails.application.routes.draw do
  devise_for :users

  post '/signup', to: 'registrations#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
