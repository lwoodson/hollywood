Admin::Engine.routes.draw do
  namespace :admin do
  get 'admin/index'
  end
  root to: 'admin#index'
end
