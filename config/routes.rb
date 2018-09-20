Rails.application.routes.draw do

  get 'dashboard', to: "dashboard/dashboard#index", as: "bank_dashboard"
  namespace :dashboard do
    resources :providers do
    end
  end

  get 'provider_admin/:provider_id', to: "provider_admin/dashboard#index", as: "dashboard_for_provider"
  namespace :provider_admin do
    resources :providers do
      resources :redemptions, only: [:index]
      resources :projects, only: [:index]
    end
  end

  get "catalog", to: "pages#catalog"
  root to: "pages#home"
end
