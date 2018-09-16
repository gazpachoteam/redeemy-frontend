Rails.application.routes.draw do
  devise_for :customers
  root to: "pages#home"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :redeemables
      resources :customers, only: %i[index show]

      post "/answers" => 'answers#get'
    end
  end

  get 'dashboard', to: "dashboard/dashboard#index", as: "bank_dashboard"
  namespace :dashboard do
    resources :providers do
      get "assistant", to: "helpdesk#index"
    end
  end

  get 'provider_admin/:provider_id', to: "provider_admin/dashboard#index", as: "dashboard_for_provider"
  namespace :provider_admin do
    resources :providers, only: [:show] do
    end
  end
end
