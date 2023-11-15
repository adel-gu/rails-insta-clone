Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pics
  root 'pics#index'
end
