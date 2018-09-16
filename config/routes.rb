Rails.application.routes.draw do
  devise_for :customers
  root to: "pages#home"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :redeemables
      resources :providers
      resources :point_types, only: %i[index]
      resources :customers, only: %i[index show] do
        post "/answers" => 'answers#get'
      end
    end
  end

  resources :providers, module: "dashboard" do
    get "assistant", to: "helpdesk#index"
  end
end
