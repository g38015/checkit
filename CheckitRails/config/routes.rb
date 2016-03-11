Rails.application.routes.draw do

  root to: "checks#index"

  namespace :admin do
    resources :checks

    root to: "checks#index"
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :checks
    end
  end

  resources :checks do
    collection { post :import }
  end
end
