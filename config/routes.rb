Rails.application.routes.draw do
  devise_for :customers
  root to: "pages#home"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :redeemables
      resources :customers, only: %i[index show]
    end
  end
end
