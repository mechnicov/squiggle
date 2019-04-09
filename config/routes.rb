Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'registrations', passwords: 'passwords' }

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: :show

  get '/uncategorized', to: 'categories#uncategorized', as: 'uncategorized'
  root 'items#index'
end
