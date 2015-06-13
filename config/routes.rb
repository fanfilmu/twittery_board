Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  devise_scope :user do
    get "sign_out", :to => "devise/sessions#destroy", :as => :destroy_user_session
  end

  root to: "static_pages#home"

  resources :comments, only: [ :new, :create, :index ]

  resources :events, only: [ :new, :create, :index, :show ] do
    resources :comments
  end
end
