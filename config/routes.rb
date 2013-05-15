Bonsai::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

    get "contact/index", :id => "contact"
  match "contact" => "contact#index"

    resources :users do
        resources :posts do
            resources :comments
            end
            end
end