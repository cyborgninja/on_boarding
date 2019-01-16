Rails.application.routes.draw do
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
