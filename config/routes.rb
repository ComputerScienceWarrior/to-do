Rails.application.routes.draw do
  resources :user, only: [:show, :new, :edit, :update, :destroy] do
    resources :list, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :list, only: [:index, :show] do
    resources :list_item, only: [:index]
  end

  root "pages#home"
end
