Onagawa::Application.routes.draw do
  resources :resets, :only => [:new,:create]

  resources :locales, :only => [:create,:update]
  resources :translations, :only => [:index,:create] do
    collection do
      delete 'delete'
    end
  end

  resources :settings, :only => [:show, :edit, :update]

  resources :info_sections, :except => :index do
    collection do
      get 'default'
    end
    resources :info_subsections do
      member do
        put 'ascend'
        put 'descend'
      end    
    end
  end

  resources :messages
  resources :payment_notifications

  resources :profiles do
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
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  resources :sessions
  resources :users do
    member do
      get 'edit_roles'
      put 'update_roles'
      put 'update_password'
      get 'change_password'
    end
  end

  match 'welcome' => 'info_sections#default'
  root :to => "info_sections#default"
end
