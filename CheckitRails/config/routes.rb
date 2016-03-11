Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :checks
    end
  end

  root to: "checks#index"

  resources :checks do
    collection { post :import }
  end
end
