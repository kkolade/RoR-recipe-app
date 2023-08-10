Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }
  root "recipes#public_index"
  resources :inventories, except: [:edit, :update] do
    resources :foods, only: [:new, :create], controller: 'inventory_foods'
  end
  resources :recipes, only: [:index, :show, :destroy, :update, :new, :create] do
    member do
      patch :toggle_public
      get 'modal'
    end
    
    resources :foods, only: [:new, :create], controller: 'recipe_foods'
    post :create_shopping_list, to: 'shopping_lists#create'
  end

  resources :foods, only: [:index, :destroy, :new, :create]
  resources :shopping_lists, only: [:index]
end
