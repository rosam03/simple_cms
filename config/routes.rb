Rails.application.routes.draw do

  root :to => 'public#index'
  get 'show/:permalink', :to => 'public#show', :as =>  'public_show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :admin_users do
    member do
      get :delete
    end
  end

end
