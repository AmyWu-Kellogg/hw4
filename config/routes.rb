Rails.application.routes.draw do
  root "places#index"
  resources :places do
    resources :entries
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
