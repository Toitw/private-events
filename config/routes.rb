Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :attendances, only: [:create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  #I want to add a route to my_events
  resources :my_events, only: [:index]
  
  root "events#index"
end
