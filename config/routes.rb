require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # get 'welcome/index' default was
  #get '/', to: 'welcome#index'
  root to: 'welcome#index'

  mount Sidekiq::Web => 'sidekiq'

  resources :articles do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :pictures do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end

  end
    get '/weather' => 'weather#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
