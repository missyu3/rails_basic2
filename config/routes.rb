Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]
  resources :pictures
  
end
