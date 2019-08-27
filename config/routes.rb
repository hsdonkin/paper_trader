Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get '/search', to: 'pages#search'
  resources :stocks

end
