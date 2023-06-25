Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :show, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
end
