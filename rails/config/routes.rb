Rails.application.routes.draw do
  resources :articles
  resource :configuration, only: :show

  root "articles#index"
end
