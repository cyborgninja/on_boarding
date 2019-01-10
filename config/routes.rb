Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id', to: 'users#show'
  post 'users', to: 'users#create'
  put 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#destroy'

  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new'
  get 'users/:id/edit', to: 'users#edit'

  root to: 'users#index'
end
