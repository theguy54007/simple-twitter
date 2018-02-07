Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # 請依照專案指定規格來設定路由
  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index, :create, :destroy]

    member do
      post :like
      post :unlike
    end


  end

  root "tweets#index"

  namespace :admin do
    resources :tweets, only: [:index, :destroy]
    root "tweets#index"
  end


  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]



end
