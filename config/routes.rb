Rails.application.routes.draw do
resources :topics, only:[:index, :new, :create]
#get 'topics' => 'topics#index'
end
