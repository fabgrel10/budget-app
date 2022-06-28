Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  devise_scope :user do
    authenticated do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated do
  root to: 'home#index', as: :unauthenticated_root
    end

    get '/logout', to: 'devise/sessions#destroy'
  end

  resources :categories, only: %i[index new create show] do
    resources :expenses, only: %i[index new create show]
  end
end
