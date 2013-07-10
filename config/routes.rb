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
  end

  resources :users, :bikers, except: [:destroy] do
    resources :checkouts, only: [:index]
  end

  resources :checkouts, except: [:edit, :destroy] do
    member do
      delete '', to: 'checkouts#checkin', as: :checkin
    end
  end
end
