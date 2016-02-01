Rails.application.routes.draw do
  resources :users, except: [:edit, :update, :destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
