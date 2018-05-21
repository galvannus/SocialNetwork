Rails.application.routes.draw do
  resources :posts
  resources :usuarios, as: :users, only: [:show,:update]

  devise_for :users
  get 'main/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
  	root to: "main#home"
  end
  unauthenticated :user do
  	root to: "main#unregistered"
  end
end
