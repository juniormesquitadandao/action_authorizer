Rails.application.routes.draw do
  devise_for :users, path: 'accounts'
  authenticated do
    root to: redirect('/products'), as: :account_root
  end
  resources :products
  resources :users

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
