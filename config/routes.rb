Bonsai::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

    resources :users do
        resources :posts do
            resources :comments
            end
            end
end