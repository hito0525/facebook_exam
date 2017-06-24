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

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :relationships, only: [:create, :destroy, :edit, :update]

  resources :conversations do
    resources :messages
  end

end
