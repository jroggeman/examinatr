Rails.application.routes.draw do
  get 'sessions/new'

  resources :users, except: [:edit, :update, :destroy]
end
