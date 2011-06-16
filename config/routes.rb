Onagawa::Application.routes.draw do
  resources :locales, :only => [:create,:update]
  resources :translations, :only => [:index,:create] do
    collection do
      delete 'delete'
    end
  end

  resources :info_sections do
    resources :info_subsections do
      member do
        put 'ascend'
        put 'descend'
      end    
    end
  end

  resources :messages

  get "operator/info"
  get "operator/info2"
  get "operator/info3"
  get "operator/info4"
  get "operator/contact"

  resources :payment_notifications

  resources :orders do
    collection do
      post 'purchase'
    end
  end

  match 'info' => 'operator#info'
  match 'info2' => 'operator#info2'
  match 'info3' => 'operator#info3'
  match 'info4' => 'operator#info4'
  match 'contact' => 'operator#contact'
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

  match 'welcome' => 'orders#new'
  root :to => "orders#new"
end
