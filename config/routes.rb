Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }
  root "recipes#public_index"
  resources :inventories, except: [:edit, :update]  
  resources :recipes, only: [:index, :show, :destroy, :update] do
    member do
      patch :toggle_public
      get 'modal'
    end
    
    resources :foods, only: [:new, :create]
    post :create_shopping_list, to: 'shopping_lists#create'
  end
end
