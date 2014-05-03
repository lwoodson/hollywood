Admin::Engine.routes.draw do
  namespace :admin do
  get 'dashboard/index'
  end

  namespace :admin do
  get 'admin/index'
  end
  root to: 'dashboard#index'
end
