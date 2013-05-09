Copenhagen::Application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  root :to => 'home#index'

  resources :locations, only: [:show, :index] do
    resources :checkouts, only: [:index]
  end

  resources :bikes do
    resources :checkouts, only: [:new, :create, :index]
    collection do
      get :offline
      get :fucked
    end
    member do
      post :bring_online
      post :take_offline
    end
  end

  resources :users, :bikers do
    resources :checkouts, only: [:index]
  end

  resources :checkouts, except: [:edit] do
    member do
      post :checkin
    end
  end
end
