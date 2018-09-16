Rails.application.routes.draw do
  devise_for :customers
  root to: "pages#home"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :customers, only: %i[index show] do
        post "/answers" => 'answers#get'
      end
    end
  end

  resources :customers do
    get "assistant", to: "helpdesk#index"
  end
end
