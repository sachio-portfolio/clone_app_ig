Rails.application.routes.draw do
  root 'pictures#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
