Admin::Engine.routes.draw do
  resources :movies, :actors
  root to: 'dashboard#index'
end
