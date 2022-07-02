Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    root to: 'home#index', as: :unauthenticated_root
  end

  resources :categories, only: %i[index new create show] do
    resources :expenses, only: %i[index new create show]
  end

  root to: 'categories#index'
end
