Bonsai::Application.routes.draw do
  get "about/index"

  get "privacy_policy/index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    authenticated :user do
    root :to => 'posts#index'
    end
        get "privacy_policy/index", :id => "privacy_policy"
        match "privacy_policy" => "privacy_policy#index"
      root :to => "home#index"
        get "about/index", :id => "about"
        match "about" => "about#index"

      match 'contact' => 'contact#new', :as => 'contact', :via => :get
      match 'contact' => 'contact#create', :as => 'contact', :via => :post
      
      resources :users
      resources :posts do
 
  end
end