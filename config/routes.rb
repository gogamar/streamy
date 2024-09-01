Rails.application.routes.draw do
  resources :users do
    get 'library', on: :member
    resources :contents, only: [:index, :show]
    resources :movies, only: [:index]
    resources :seasons, only: [:index] do
      resources :episodes, only: [:show]
    end
    resources :purchases, only: [:create]
  end

  root 'endpoints#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
