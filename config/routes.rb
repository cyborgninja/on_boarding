Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # これ↓がないとmailerでURLが表示できない
  default_url_options host: 'localhost:3000'

  root to: 'users#index'

  resources :users
  resources :entries, only: :index
  resources :blogs do
    scope module: :blogs do
      resources :entries do
        scope module: :entries do
          resources :comments do
            put :approve, on: :member
          end
        end
      end
    end
  end

end
