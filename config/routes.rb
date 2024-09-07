Rails.application.routes.draw do
  resources :users do
    resources :lists, only: [:new, :show, :index, :create]
  end
  resources :lists, only: [:index, :show] do
    resources :list_items, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  get '/login', to: 'sessions#create'

  root "pages#home"
end
