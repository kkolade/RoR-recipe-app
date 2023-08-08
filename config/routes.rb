Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }
  root "recipes#public_index"

  resources :recipes, only: [:index, :show]
  resources :inventories, except: [:edit, :update]
end
