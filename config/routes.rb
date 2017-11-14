Rails.application.routes.draw do
  resources :companies, only: [:index] do
    collection do
      get :alphabetical
      get :with_modern_plan
    end
  end
end
