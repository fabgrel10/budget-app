Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      root to: 'categories#index', as: 'user'
    end

    unauthenticated do
      root to: 'home#index', as: 'unauthenticated_user_root'
    end

    get '/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users
  resources :categories, only: %i[index new create show] do
    resources :expenses, only: %i[index new create show]
  end

  root to: 'categories#index'
end
