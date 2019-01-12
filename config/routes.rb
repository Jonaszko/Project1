Rails.application.routes.draw do
  devise_for :users
  # get 'welcome/index' default was
  #get '/', to: 'welcome#index'
  root to: 'welcome#index'

  resources :articles do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
