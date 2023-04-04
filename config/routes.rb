Rails.application.routes.draw do

  devise_for :users
  root to:  "tops#index"
  resources :tops, only: [:index]
  resources :records do
    collection do
      get 'search'
    end
  end
end
