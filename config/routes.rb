Rails.application.routes.draw do
  resources :companies, only: [:index] do
    collection do
      get :alphabetical
      get :with_modern_plan
      get :not_trialing
    end
  end
end
