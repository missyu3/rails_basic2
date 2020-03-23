Rails.application.routes.draw do

  root to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
