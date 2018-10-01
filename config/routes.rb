Rails.application.routes.draw do

  get '/sign_in' => 'users#login_form', as: :sign_in_user
  post '/request_token' => 'users#request_token'
  post '/sign_in' => 'users#login'
  get '/sign_out' => 'users#logout', as: :sign_out_user

  get 'dashboard', to: "dashboard/dashboard#index"
  namespace :dashboard do
    resources :organizations
    resources :projects
    resources :redemptions
    resources :customers
  end

  resources :projects, only: [:index, :show]
  get '/finance/project/:id' => 'projects#finance', as: :finance_project

  root to: "pages#home"
end
