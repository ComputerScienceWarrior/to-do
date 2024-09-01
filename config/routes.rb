Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :lists, only: [:index, :show] do
    resources :list_items, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  root "pages#home"
end
