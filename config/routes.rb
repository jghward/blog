Rails.application.routes.draw do

  constraints Clearance::Constraints::SignedIn.new do
    resources :photos
    resources :albums do
      resources :photos
    end
    resources :passwords, controller: "clearance/passwords", only: [:create, :new]

    resources :users, controller: "clearance/users", only: [:create] do
      resource :password, controller: "clearance/passwords", only: [:create, :edit, :update]
    end
    
    resources :articles, only: [:show, :index] do
      resources :comments, only: [:create, :new]
    end

    resources :articles do
      resources :comments
    end
  end

  constraints Clearance::Constraints::SignedOut.new do
    resources :photos, only: [:show, :index]
    resources :albums, only: [:show, :index] do
      resources :photos, only: [:show, :index]
    end
    resources :articles, only: [:show, :index] do
      resources :comments, only: [:create, :new]
    end
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  if Clearance.configuration.allow_sign_up?
    get "/sign_up" => "clearance/users#new", as: "sign_up"
  end
  resource :session, controller: "clearance/sessions", only: [:create]

  root 'welcome#index'
end
