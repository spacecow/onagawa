Onagawa::Application.routes.draw do
  resources :messages

  get "operator/info"
  get "operator/info2"

  resources :payment_notifications

  resources :orders

  match 'info' => 'operator#info'
  match 'info2' => 'operator#info2'
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  resources :sessions
  resources :users do
    member do
      get 'edit_roles'
      put 'update_roles'
    end
  end

  root :to => "orders#new"
end
