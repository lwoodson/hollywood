Admin::Engine.routes.draw do
  resources :movies
  root to: 'dashboard#index'
end
