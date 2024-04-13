Rails.application.routes.draw do
  namespace :api do
    get 'comments/create'
    get 'comments/update'
    get 'earthquakes/index'
    get 'earthquakes/show'
    get 'earthquakes/create'
    get 'earthquakes/update'
    get 'earthquakes/destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
