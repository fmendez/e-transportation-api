Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    namespace :v1 do
      resources :e_transportations, only: [ :create, :index ]
      get "outside_zone_stats", to: "e_transportations#outside_zone_stats"
    end
  end
end
