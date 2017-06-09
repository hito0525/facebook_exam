Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  resources :topics, only:[:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
    root 'top#index'
end
