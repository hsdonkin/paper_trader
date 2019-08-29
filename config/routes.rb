Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/portfolio", to: "portfolios#index"
  root to: 'pages#index'
  get '/search', to: 'pages#search'
  resources :stocks do
   resources :trades
 end
  get '/user/:id', to: 'users#show', as: 'user'
  get '*path', to: 'pages#index'
end
