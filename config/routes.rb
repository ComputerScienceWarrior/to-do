Rails.application.routes.draw do
  resources :users do
    resources :lists, only: [:new, :create]
  end
  resources :lists, only: [:index, :show] do
    resources :list_items, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  root "pages#home"
end
