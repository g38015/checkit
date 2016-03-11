Rails.application.routes.draw do

  root to: "checks#index"

  resources :checks do
    collection { post :import }
  end
end
