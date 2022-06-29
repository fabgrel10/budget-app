Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  resources :categories, only: %i[index new create show] do
    resources :expenses, only: %i[index new create show]
  end
end
