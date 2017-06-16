Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  resources :topics do
    resources :comments
    post :confirm, on: :collection
    end
    root 'top#index'
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

end
