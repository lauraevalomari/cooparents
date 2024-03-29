Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :appointments do
    collection do
      get :my_appointments
      get :childs_appointments
    end
  end

  resources :appointments
  resources :tasks
  resources :children
  resources :contacts
  resources :documents


  get "/profile", to: "profiles#show"
  get "/profile/edit", to: "profiles#edit"
  patch "/profile", to: "profiles#update"
end
