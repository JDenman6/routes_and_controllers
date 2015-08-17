Rails.application.routes.draw do
  resources :users, only: [:index, :show, :destroy, :update, :create]
  resources :contacts, only: [:index, :show, :destroy, :update, :create]
end
