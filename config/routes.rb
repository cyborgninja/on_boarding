Rails.application.routes.draw do
  root to: 'users#index'

  resources :users
  resources :entries, only: :index
  resources :blogs do
    scope module: :blogs do
      resources :entries
    end
  end

end
