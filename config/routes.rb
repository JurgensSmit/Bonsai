Bonsai::Application.routes.draw do



  resources :posts do 
   resources :comments
end


  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"
  devise_for :users
  resources :users
end