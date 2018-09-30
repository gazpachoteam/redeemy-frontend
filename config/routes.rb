Rails.application.routes.draw do

  get '/sign_in' => 'users#login_form', as: :sign_in_user
  post '/request_token' => 'users#request_token'
  post '/sign_in' => 'users#login'
  get '/sign_out' => 'users#logout', as: :sign_out_user

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
